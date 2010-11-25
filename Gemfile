source 'http://rubygems.org'

gem 'rails', '~> 3.0.1'

gem 'haml'

# db backend driver
gem 'mysql2'

# authentication
gem 'devise'
gem 'omniauth'

# This is a better daemons gem
gem 'daemons', :git => 'git://github.com/ghazel/daemons.git'
gem 'delayed_job', '~> 2.1.1'

# JSON
gem 'yajl-ruby', '~> 0.7.7', :require => 'yajl/json_gem'

gem 'rest-client', '~> 1.6.1'

group :production do
  # moonshine puppety goodness
  gem 'shadow_puppet'

  # Keep things alive
  gem 'god', '~> 0.11.0', :require => nil
  gem 'dalli', '~> 0.10.0' # memcached
end

group :test, :development do
  gem 'ruby-debug'
  # workstation side remote admin/deploy
  gem 'capistrano'

  # local web server to handle long OpenID return URLs
  gem 'mongrel', '1.2.0.pre2'

  # testing
  gem 'rspec'
  gem "rspec-rails"
  gem 'webrat'
  gem "autotest"
  gem 'ruby-debug'
  gem 'awesome_print', :require => 'ap'
end
