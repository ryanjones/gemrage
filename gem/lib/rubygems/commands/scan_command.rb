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
    p platform
  end

private

  def system_scan
    if windows? && pik?
      pik_scan
    elsif !windows? && rvm?
      rvm_scan
    else
      basic_scan
    end
  end

  def pik_scan
    parse_gem_list(`pik gem list`)
  end

  def rvm_scan
    RVM.list_gemsets.map do |config|
      RVM.use(config)
      platform = rvm_platform
      parse_gem_list(RVM.perform_set_operation(:gem, 'list').stdout)
    end
  ensure
    RVM.reset_current!
  end

  def basic_scan
    Gem.source_index.map do |name, spec|
      spec.name
    end
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

  def parse_gem_list(stdout)
    stdout_split = stdout.split("\n")
    std_hash = Hash.new
    std_split.each do |s|
    name, version = s.match(/^([\w\-_]+) \((.*)\)$/)[1,2] rescue next
    std_hash[name] ||= { }
    std_hash[name][platform] = [std_hash[name][platform], version].compact.join(', ')
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
end