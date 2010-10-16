require 'rubygems/gemcutter_utilities'

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
  end

  def pik?
  end

  def rvm?
    !RVM.path.nil?
  end

  def parse_gem_list(stdout)
  end
end