require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/preference")
require("./lib/user")
require("./lib/user_profile")
require("pg")
require("pry")
require("area")

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
erb(:'users/update_profile') end

post('/profile') do   
@user = User.find(session[:id])  
@profile = Profile.new(user_id: @user.id, name: params["name"], birthday: params["birthday"], gender: params["gender"], zip: params["zip"], photo: params["photo"])
@profile.save
@preference = Preferences.create(user_id: @user.id, subject: params["subject"], level: params["level"], location: params["location"])
  
  redirect('/users/user_profile')
end

get('/users/user_profile') do
  @user = User.find(session[:id])
  @profile = @user.profile
  binding.pry
  erb(:'users/user_profile')
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