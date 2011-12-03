require "sinatra"
require "haml"
require "sass"

configure do
  set :environment, ( ARGV.index("-e") || ENV["RACK_ENV"] || "development" )
  ENV['RACK_ENV'] = settings.environment
  
  set :root,    File.dirname(__FILE__)
  set :views,   File.dirname(__FILE__) + "/views"
  set :public,  File.dirname(__FILE__) + "/public"
  
  set :haml, { format: :html5, escape_html: false }
  set :scss, { style: :compact, debug_info: false }
end

get '/' do
  response['Cache-Control'] = "public, max-age=259200"
  haml :home
end

get "/z.css" do
  response['Cache-Control'] = "public, max-age=259200"
  scss :z
end
