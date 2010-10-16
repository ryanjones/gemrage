require 'rubygems/gemcutter_utilities'
require 'rbconfig'
require 'digest/SHA1'

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
    p basic_scan.join(', ')
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

  def windows?
    Config::CONFIG['host_os'] =~ /mswin|mingw/
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
    
  end
end