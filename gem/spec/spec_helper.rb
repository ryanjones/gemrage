$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'gemrage'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
  @valid_user_attr = { 
    :email => 'support@gemrage.com',
    :password => 'password',
    :password_confirmation => 'password',
    :handle => 'support'
  }
  
  
  
end

