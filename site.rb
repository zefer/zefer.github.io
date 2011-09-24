require 'sinatra'
require 'haml'

configure do
  set :environment, ( ARGV.index("-e") || ENV["RACK_ENV"] || "development" )
  ENV['RACK_ENV'] = settings.environment
  
  set :root, File.dirname(__FILE__)
  set :public, File.dirname(__FILE__) + '/assets'
  set :views, File.dirname(__FILE__) + '/views'
  
  set :haml, :format => :html5
end

get '/' do
  haml :home
end