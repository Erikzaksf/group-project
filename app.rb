require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/subject")
require("./lib/user")
require("./lib/login")
require("pg")
require("pry")



get '/' do
  erb(:index)
end

get('/signup')do
  erb(:signup)
end

get('/sessoins/login')do
  erb(:login)
end

get('')do
  erb(:subjects)
end

get('')do
  erb(:subject_detail)
end

get('')do
  erb(:register)
end

#####

# get '/registrations/signup' do
#   erb(:signup)
# end
#
# post '/registrations' do
#   erb(:)
# end
#
# post '/sessions' do
#
# end
# get '/sessions/logout' do
#
# end
#
# get '/users/home'
#
# shows user's homepage
# end
