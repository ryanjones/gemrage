require "bundler/capistrano"

server '178.79.143.150', :app, :web, :db, :primary => true

set :bundle_flags,    "--deployment"
set :bundle_without,  [:development, :test]

