require 'yaml'
require 'microservice_precompiler'

precompiler = MicroservicePrecompiler::Builder.new
precompiler.mustaches_filename = "mustaches.yml"
precompiler.compile

require 'fileutils'
puts "Moving unauthorized.html to dist/views/NewAuthRegistration.html..."
FileUtils.cp('unauthorized.html', 'dist/views/NewAuthRegistration.html')
