source 'http://rubygems.org'

gem 'rails', '3.0.1'

# db backend driver
gem 'mysql'

# authentication
gem 'devise'
gem 'omniauth'
gem 'daemons', :git => 'git://github.com/ghazel/daemons.git' # This is a better daemons gem
gem 'delayed_job', '~> 2.1.0.pre'

group :production do
  # moonshine puppety goodness
  gem 'shadow_puppet'
  gem 'god', '~> 0.11.0', :require => nil # Keep things alive
end

group :test, :development do
  # workstation side remote admin/deploy
  gem 'capistrano'

  # local web server to handle long OpenID return URLs
  gem 'mongrel', '1.2.0.pre2'

  # testing
  gem 'rspec'
  gem "rspec-rails"
  gem 'webrat'
  gem "autotest"
end
