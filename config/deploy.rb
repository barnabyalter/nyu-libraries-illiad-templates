require 'capistrano/ext/multistage'

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :repository, "./dist" 
set :scm, :none 
set :deploy_via, :copy