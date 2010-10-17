require 'rubygems/gemcutter_utilities'
require 'rbconfig'
require 'digest/sha1'

# Holy shit disgusting
Gem.clear_paths
paths = ENV['GEM_PATH'].to_s.split(':')
paths.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'vendor', 'ruby', '1.8')))
ENV['GEM_PATH'] = paths.join(':')
ENV['BUNDLE_GEMFILE'] = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'Gemfile'))

require 'bundler'
require 'uri'
require 'rvm'
require 'rest-client'
require 'json'
require 'macaddr'

class Gem::Commands::ScanCommand < Gem::Command
  include Gem::GemcutterUtilities

  GemrageHost = 'http://gemrage.com/'
  # GemrageHost = 'http://localhost:3000/'

  def initialize
    super('scan', description)
  end

  def description
    'Scan your gems and upload to gemrage.com'
  end

  def arguments
    '[DIR]        Optional directory to scan for project files'
  end

  def usage
    program_name
  end

  def execute
    if dir = get_one_optional_argument
      notify(send_project_to_gemrage(project_scan(File.expand_path(dir))))
    else
      notify(send_system_to_gemrage(system_scan))
    end
  end

private

  def send_system_to_gemrage(gems)
    RestClient.post(URI.join(GemrageHost, '/api/v1/payload/system.json').to_s, :payload => { :header => { :machine_id => mac_hash }, :installed_gems => gems })
  end

  def send_project_to_gemrage(payload)
    payload.to_json
  end

  def project_scan(dir)
    Dir[File.join(dir, '**', '{Gemfile}')].map do |gemfile|
      project_name = File.basename(File.dirname(gemfile))
      project_id = Digest::SHA1.hexdigest(File.dirname(gemfile))
      lockfile = parse_lockfile("#{gemfile}.lock")

      begin
        d = Bundler::Definition.build(gemfile, nil, nil)
        deps = d.current_dependencies
        {
          :name => project_name,
          :identifier => project_id,
          :gems => Hash[*deps.map do |dep|
            [dep.name, lockfile[dep.name] || dep.requirement.to_s]
          end.flatten]
        }
      rescue Exception => boom
        # Maybe it's an old Gemfile
        nil
      end
    end.compact
  end

  def parse_lockfile(lockfile)
    if File.exists?(lockfile)
      h = {}
      File.readlines(lockfile).each do |line|
        line.strip!
        # Don't care about any lines with range operators on versions
        next if line.match(/[~><=]/)
        name, version = get_name_and_versions!(line) rescue next
        h[name] = version
      end
      h
    else
      {}
    end
  end

  def system_scan
    if windows? && pik?
      notify("Scanning with pik")
      pik_scan
    elsif !windows? && rvm?
      notify("Scanning with RVM...this might take a while")
      rvm_scan
    else
      notify("Scanning with basic gem support")
      basic_scan
    end
  end

  def pik_scan
    parse_gem_list(`pik gem list`) rescue {}
  end

  def rvm_scan
    h = {}
    RVM.list_gemsets.map do |config|
      notify('Scanning RVM config ', config)
      begin
        rd, wr = IO.pipe
        pid = fork do
          begin
            # Clear this because shenanigans ensue
            ENV['BUNDLE_GEMFILE'] = nil
            RVM.use(config)
            wr.write("#{rvm_platform}\n")
            # Have to do it this way to get stdout instead of just the okay from RVM
            wr.write(RVM.perform_set_operation(:gem, 'list').stdout)
          ensure
            # No, mister superman no here...
            RVM.reset_current!
            # Ensure we close these inside the fork
            rd.close unless rd.closed?
            wr.close unless wr.closed?
          end
        end
        # Close the write pipe so eof works and we don't hang
        wr.close unless wr.closed?
        Process.waitpid(pid)
        plat = rd.readline.chomp.to_sym
        h = merge_gem_list(h, parse_gem_list(rd.read, plat))
      rescue => boom
        # Don't care right now
        # Might be an IO problem or whatever, just skip it
      ensure
        # Ensure we close these outside the fork
        rd.close unless rd.closed?
        wr.close unless wr.closed?
      end
    end
    h
  rescue => boom
    notify('There was an error scanning: ', boom.message)
    notify('On line: ', boom.backtrace.first)
    notify('Please report this at http://gemrage.com/ so we can fix it!')
    {}
  ensure
    RVM.reset_current!
  end

  def merge_gem_list(*hashes)
    h = {}
    hashes.each do |hash|
      hash.each do |name, platform_hash|
        h[name] ||= {}
        platform_hash.each do |platform, versions|
          h[name][platform] = [h[name][platform], versions].compact.uniq.join(',')
        end
      end
    end
    h
  end

  def basic_scan
    plat = platform
    h = {}
    Gem.source_index.map do |name, spec|
      h[spec.name] ||= {}
      h[spec.name][plat] = [spec.version.to_s, h[spec.name][plat]].compact.uniq.join(',')
    end
    h
  end

  def pik?
    `pik` rescue false
  end

  def rvm?
    !RVM.path.nil?
  end

  def mac_hash
    Digest::SHA1.hexdigest(Mac.addr)
  end

  def parse_gem_list(stdout, plat = platform)
    h = {}
    stdout.split("\n").each do |line|
      name, versions = get_name_and_versions!(line) rescue next
      versions = versions.split(',').map { |version| version.strip.split.first }
      h[name] ||= {}
      h[name][plat] = [h[name][plat], versions].compact.uniq.join(',')
    end
    h
  end

  def get_name_and_versions!(line)
    line.match(/^([\w\-_]+) \((.*)\)$/)[1,2]
  end

  def rvm_platform
    platform(rvm_const('RUBY_ENGINE'), rvm_const('RUBY_DESCRIPTION'), rvm_const('RUBY_VERSION'))
  end

  def rvm_const(rc)
    c = RVM.ruby("print #{rc}").stdout.strip and c = c.empty? ? nil : c
  end

  def windows?
    Config::CONFIG['host_os'] =~ /msdos|mswin|djgpp|mingw/
  end

  def platform(engine = (defined?(RUBY_ENGINE) ? RUBY_ENGINE : nil),
               description = (defined?(RUBY_DESCRIPTION) ? RUBY_DESCRIPTION : nil),
               version = (defined?(RUBY_VERSION) ? RUBY_VERSION : nil))
    if engine && engine == 'jruby'
      :jruby
    elsif engine && engine == 'ironruby'
      :ironruby
    elsif windows?
      :windows
    elsif engine && engine == 'rbx'
      :rubinius
    elsif description && description =~ /Ruby Enterprise Edition/
      :ree
    elsif engine && engine == 'macruby'
      :macruby
    elsif engine && engine == 'maglev'
      :maglev
    elsif version && version == '1.8.6'
      :mri_186
    elsif version && version == '1.8.7'
      :mri_187
    elsif version && version =~ /^1\.9/
      :mri_19
    else
      :unknown
    end
  end

  def notify(*messages)
    print(*messages)
    print("\n")
  end
end