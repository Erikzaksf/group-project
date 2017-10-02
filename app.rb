require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/subject")
require("./lib/user")
require("./lib/login")
require("pg")
require("pry")

get('/')do
  erb(:'users/home')
end

get('/sessions/login')do
  erb(:'sessions/login')
end

get('/registrations/signup')do
  erb(:'registrations/signup')
end

post('/registrations/signup')do
binding.pry
  erb(:'users/user_profile')
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
