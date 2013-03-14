# Load bundler-capistrano gem
require "bundler/capistrano"
# Load rvm-capistrano gem
require "rvm/capistrano"
require 'microservice_precompiler'

set :stages, ["development", "staging", "production"]
set :default_stage, "development"
require 'capistrano/ext/multistage'

# RVM  vars
set :rvm_ruby_string, "1.9.3-p125"
set :application, "illiad"

namespace :deploy do
  desc "Run precompiler gem to create distribution package"
  task :compile do
    precompiler = MicroservicePrecompiler::Builder.new
    precompiler.mustaches_config = "mustaches.yml"
    precompiler.compile
  end
  
  desc "Update submodules from github in local project"
  task :update_submodules do
    system("git submodule init")
    system("git submodule update")
    system("cd sass/lib; git pull origin master")
    system("cd javascripts/lib; git pull origin master")
  end
  
  desc "Deploy to server with FTP"
  task :ftp_setup do
    system "lftp -u #{login},#{password} -e \"cd #{app_path}; mkdir -p #{app_path}/javascripts; mkdir -p #{app_path}/stylesheets; exit;\" #{host}" 
  end
  
  desc "Deploy to server with FTP"
  task :ftp_sync do
    system "lftp -u #{login},#{password} -e \"cd #{app_path}; mput ./dist/views/*.html; cd #{app_path}/javascripts; put ./dist/javascripts/illiad.js; cd #{app_path}/stylesheets; put ./dist/stylesheets/illiad.css; exit\" #{host}" 
  end
  
  task :ftp do
    puts "Deploying through FTP..."
  end
  
end

before "deploy:compile", "deploy:update_submodules"
before "deploy:ftp", "deploy:compile"
after "deploy:compile", "deploy:ftp_sync"
