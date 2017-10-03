require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/subject")
require("./lib/user")
require("./lib/user_profile")
require("pg")
require("pry")

enable :sessions

get('/')do
  erb(:'users/index')
end

get('/sessions/login')do
  erb(:'sessions/login')
end

get('/registrations/signup')do
  erb(:'registrations/signup')
end

post('/register')do
  @user = User.new(user_name: params["user_name"], email: params["email"], password: params["password"])
  @user.save
  session[:id] = @user.id
  redirect '/users/update_profile'
end

get '/users/update_profile' do
  @user = User.find(session[:id])
  erb(:'users/update_profile')
end

get('/sessions/login')do
   erb(:'sessions/login') 
 end

post('/login') do
	@user = User.find_by(user_name: params["user_name"], password: params["password"])
	session[:id] = @user.id
	redirect '/users/dashboard'
end

get('/users/dashboard') do
@user = User.find(session[:id])
	erb(:'users/dashboard')
end

get('/logout') do
	session.clear
	erb(:'users/index')
end