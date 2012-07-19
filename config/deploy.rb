require 'capistrano/ext/multistage'
require 'microservice_precompiler'

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :repository, "./dist" 
set :scm, :none 
set :deploy_via, :copy

set :keep_releases, 5
set :use_sudo, false

set :application, "illiad"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  desc "Run precompiler gem to create distribution package"
  task :compile do
    precompiler = MicroservicePrecompiler::Builder.new
    precompiler.mustaches_config = "mustaches.yml"
    precompiler.compile
  end
  
  desc "Update submodules from github in local project"
  task :update_submodules do
    system("cd sass/lib; git pull origin master")
    system("cd javascripts/lib; git pull origin master")
    #system("git submodule update")
  end
  
  desc "Copy release to application root"
  task :copy_release_to_application, :roles => :app do
   run "cp -R #{latest_release}/* #{deploy_to}"
  end
    
  desc "Move views files to root"
  task :copy_views_to_root do
    run "mv #{deploy_to}/views/* #{deploy_to}/"
    run "rm -rf #{deploy_to}/views"
  end

  desc "No symlink creation necessary for ILLiad."
  task :symlink do
    puts "Skipping symlink creation."
  end
  
  desc "Restarting is unnecessary for ILLiad."
  task :restart do
    puts "Skipping restart."
  end

  before "deploy", "deploy:update_submodules", "deploy:compile"
  after "deploy:update_code", "deploy:copy_release_to_application", "deploy:copy_views_to_root"
end