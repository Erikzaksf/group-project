require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/subject")
require("./lib/user")
require("./lib/login")
require("pg")
require("email_validator")
require("pry")

get('/')do
  erb(:'users/index')
end

get('/sessions/login')do
  erb(:'sessions/login')
end
post '/sessions' do
  @user = User.find_by(email: params["email"], password: params["password"])
  session[:id] = @user.id
  # binding.pry
  redirect "/users/#{@user.id}/home"
end

get('/registrations/signup')do
  erb(:'registrations/signup')
end

post('/registrations/signup')do
  @user = User.new(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
  # binding.pry
  if @user.save() && @user.password == params['password_confirm'] && @user.email == params['email_confirm']
    session[:id] = @user.id
    redirect "/users/#{@user.id}/home"
  else
    redirect "/registrations/signup"
  end
end

get '/users/:id/home' do
  @id = params['id'].to_i
  @user = User.find(@id)
  erb(:'users/user_profile')
end

get('/sessions/logout')do
    session.clear
  erb(:'users/home')
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
