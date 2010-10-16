source 'http://rubygems.org'

gem 'rails', '3.0.1'

# db backend driver
gem 'mysql'

# authentication
gem 'devise'
gem 'omniauth'

group :production do
  # moonshine puppety goodness
  gem 'shadow_puppet'
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
