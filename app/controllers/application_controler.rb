
require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
# require("./lib/recipe")
# require("./lib/category")
# require("./lib/ingredient")
require("pg")
require("pry")


get '/' do
  erb :home
end
#
# get '/registrations/signup' do
#
#   erb(:app/views/registrations/signup)
# end
#
# post '/registrations' do
#   submits the signup form
#
#   erb(:)
# end
#
# get '/sessions/login'
#
#   responsible for rendering login form
#   erb(:)
# end
#
# post '/sessions'
#   receives post requests from submit on login form, looks for a match
#   to existing user account info and when one is found, signs the user in.
#
#   erb(:)
# end
#
# get '/sessions/logout' do
#
#   logs user out and clears the session hash.
#
# end
#
# get '/users/home' do
#   renders the user's homepage view
# end
