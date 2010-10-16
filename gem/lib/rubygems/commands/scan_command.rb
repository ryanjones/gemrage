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
    p 'Hello, World!'
  end
end