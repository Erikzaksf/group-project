require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/meetup")
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
  if(@user.id)
  
  session[:id] = @user.id
  redirect '/users/update_profile'
else 
    @message = "user already exists"
    erb :'error'
  end
end

get '/users/update_profile' do   
@user = User.find(session[:id])
erb(:'users/update_profile') end

post('/profile') do   
@user = User.find(session[:id])  
@profile = Profile.new(user_id: @user.id, name: params["name"], birthday: params["birthday"], gender: params["gender"], zip: params["zip"], photo: params["fileToUpload"], bio: params["bio"])
@profile.save
redirect '/users/user_profile'
end

get('/users/user_profile') do
  @user = User.find(session[:id])
  @profile = @user.profile
  erb(:'users/user_profile')
end


get('/sessions/login')do
   erb(:'sessions/login') 
 end

post('/login') do
	@user = User.find_by(user_name: params["user_name"], password: params["password"])
  if(@user)
	session[:id] = @user.id 
	redirect '/users/dashboard'
  else
    @message = "Wrong id or password"
    erb :error
  end
end

get('/users/dashboard') do
@user = User.find(session[:id])
	erb(:'users/dashboard')
end

get('/new_meetup') do
  erb :'users/new_meetup'
end

post('/new_meetup') do
 @meetup = Meetup.create(name: params['name'],date: params['date'], catagory: params['category'], zip: params['zip'], street: params['street'], city: params['city'], state: params['state'], description: params['desc'])
  redirect '/users/meetup'
end

get('/users/meetup') do

@user = User.find(session[:id])
@meetups = Meetup.all
  erb(:'users/meet_up')
  
end

post('/join') do
  @user = User.find(session[:id])
  @meet_up = Meetup.find(params["meetup_id"])
  if (!@meet_up.users.include? @user)
      @meet_up.users.push(@user)
  end
  redirect back
  
end

get('/tech') do
  @meetups = Meetup.all
  erb :'categories/tech'
end
get('/outdoors') do
  @meetups = Meetup.all
  erb :'categories/outdoor'
end

get('/cooking') do
  @meetups = Meetup.all
  erb :'categories/cooking'
end

get '/gaming' do
  @meetups = Meetup.all
  erb :'categories/gaming'
end

get('/logout') do
	session.clear
	erb(:'users/index')
end