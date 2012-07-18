The deploy/ folder with production.rb and staging.rb has been gitignored from this directory because it contains implementation specific information. Before you can usse the Capistrano deploy script with this project you will need to create a directory structure as follows:

	deploy/
		production.rb
		staging.rb

Where production.rb looks something like:

	server "app.institution.edu", :app, :web, :db, :primary => true
	set :deploy_to, "/wwwroot/#{application}"
	
	set :user, "appuser"

And staging.rb looks similar but with staging environment:

	server "devapp.institution.edu", :app, :web, :db, :primary => true
	set :deploy_to, "/wwwroot/#{application}"
	
	set :user, "devuser"
