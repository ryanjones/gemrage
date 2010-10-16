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
Bundler.setup
Bundler.require

class Gem::Commands::ScanCommand < Gem::Command
  include Gem::GemcutterUtilities

  GemrageHost = 'http://gemrage.com/'

  def initialize
    super('scan', description, :dir => '')
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
    p system_scan
  end

private

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
    parse_gem_list(`pik gem list`)
  end

  def rvm_scan
    h = {}
    RVM.list_gemsets.map do |config|
      notify("Scanning RVM config ", config)
      RVM.use(config)
      h = merge_gem_list(h, parse_gem_list(RVM.perform_set_operation(:gem, 'list').stdout, rvm_platform))
    end
    h
  rescue => boom
    notify("There was an error scanning: ", boom.message)
    notify("On line: ", boom.backtrace.first)
    notify("Please report this at http://gemrage.com/ so we can fix it!")
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
          h[name][platform] = [h[name][platform], versions].join(', ')
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
      h[spec.name][plat] = [spec.version.to_s, h[spec.name][plat]].compact.join(', ')
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
      h[name] ||= { }
      name, versions = line.match(/^([\w\-_]+) \((.*)\)$/)[1,2] rescue next
      versions = versions.split(",").map { |version| version.strip.split.first }
      std_hash[name] ||= { }
      std_hash[name][plat] = [std_hash[name][plat], versions].compact.join(',')
    end
    h
  end

  def rvm_platform
    engine = RVM.ruby('print RUBY_ENGINE').stdout and engine = engine.empty? ? nil : engine
    description = RVM.ruby('print RUBY_DESCRIPTION').stdout and description = description.empty? ? nil : description
    version = RVM.ruby('print RUBY_VERSION').stdout and version = version.empty? ? nil : version
    platform(engine, description, version)
  end

  def windows?
    Config::CONFIG['host_os'] =~ /mswin|mingw/
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