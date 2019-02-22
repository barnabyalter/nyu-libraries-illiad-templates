require 'yaml'
require 'microservice_precompiler'

precompiler = MicroservicePrecompiler::Builder.new
precompiler.mustaches_filename = "mustaches.yml"
precompiler.compile