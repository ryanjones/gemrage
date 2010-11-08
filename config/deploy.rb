require "bundler/capistrano"

server 'gemrage.com', :app, :web, :db, :primary => true

set :bundle_flags,    "--deployment"
set :bundle_without,  [:development, :test]

namespace :dj do
  task :restart do
    sudo 'god restart dj'
  end
end

after 'god:restart', 'dj:restart'