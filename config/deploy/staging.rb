server "128.122.90.45", :app, :web, :db, :primary => true
set :deploy_to, "/cygdrive/c/inetpub/wwwroot/#{application}"

set :user, "ba36"