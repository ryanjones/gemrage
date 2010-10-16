require 'rubygems/gemcutter_utilities'

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
    p 'Hello, world!'
  end
end