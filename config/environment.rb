ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Dotenv.load #if ENV['SINATRA_ENV'] == "development" #=> allow the var .env to be loaded only if SINATRA_ENV is development

set :database_file, "./database.yml" #=> establishing the connection to the database by directing the use of the .yml file


require_all 'app'
require 'pry'