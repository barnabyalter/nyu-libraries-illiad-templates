server "illdev.library.nyu.edu", :app, :web, :db, :primary => true
set :deploy_to, "/cygdrive/d/Inetpub/wwwroot/#{application}"

set :user, "illiad"