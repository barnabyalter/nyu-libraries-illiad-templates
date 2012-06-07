set :application, "illiad"

server "128.122.90.45", :app, :web, :db, :primary => true
set :deploy_to, "/cygdrive/c/inetpub/wwwroot/"

set :user, "ba36"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
# 
# 
namespace :deploy do
  task :compile do
    #%x{"rake -f /Users/barnabyalter/Documents/workspace/github-repository/nyu-libraries-compass-sprockets-mustache-rake/Rakefile nyu_libraries_assets:compile[#{File.dirname(__FILE__)},mustaches.yml,/dist,true]"}
  end
  
  desc "Recreate symlink"
  task :resymlink, :roles => :app do
    run "rm -f #{current_path}"
    run "ln -s #{release_path} #{deploy_to}#{application}"
  end
    
  desc "Move views files to root"
  task :views_to_root do
    run "mv #{deploy_to}#{application}/views/* #{deploy_to}#{application}/"
  end
  
  #before "deploy", "deploy:compile"
  after "deploy:symlink", "deploy:resymlink", "deploy:views_to_root"
end