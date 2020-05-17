class UsersController < ApplicationController
  
  # signup route
  # login route  
  # logout route 

  # the purpouse of signup route is to render the signup page (form)

  get '/signup' do
    if logged_in?
      redirect '/books'
    else 
      erb : 'users/signup'
    end 
  end 

  post '/signup' do
    if User.find_by(name: params[:name])
       redirect '/signup'
    elsif params[:name].empty? && params[:password].empty?
       redirect '/signup'
    end 
      @user = User.new(params)
    if @user.save
      sessions[:user_id]= @user.id
      redirect '/books'
    end 
  end   

  
  end 


  # the purpouse of  GET login route is to render the login page (form)


  #the purpouse of POST login route is to recieve  the login form.
  #find a user, and log the user in (create a session)

end 