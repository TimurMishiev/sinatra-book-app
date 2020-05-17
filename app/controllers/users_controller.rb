class UsersController < ApplicationController
  
  # signup route
  # login route  
  # logout route 

  # the purpouse of signup route is to render the signup page (form)

  get '/signup' do
    if logged_in?
      redirect '/books'
    else
    erb :'users/signup'
  end
  end
  
  post '/signup' do
    if User.find_by(name: params[:name])
      #flash[:alert] = "User with this name already exist, please go to Log in page"
      redirect'/signup'
    elsif params[:name].empty? && params[:password].empty?
      #flash[:alert] = "Username and password are required"
      redirect '/signup'
    end
      @user = User.new(params)
    if  @user.save
      session[:user_id]= @user.id
    redirect '/books'
   end
  end

  get '/login' do
    if !logged_in?
       erb :'users/login'
    else
       redirect'/books'
    end
  end
  

  post '/login' do
    user = User.find_by(:name => params[:name])
     if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/books'
     end
      #flash[:alert] = "Username and password are required or not exist please go to Sign up page"
      redirect '/login'
     end



end 