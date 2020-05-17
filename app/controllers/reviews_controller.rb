class ReviewsController < ApplicationController
  
  
  get '/reviews/:id/new' do
    if logged_in?
        @book = Book.find_by_id(params[:id])
     erb:'reviews/new'
    else 
        redirect '/login'
    end 
  end 


  post '/reviews/:book_id' do
    @book = Book.find_by_id(params[:id])
    if params[:content].empty?
      redirect "/reviews/#{@book.id}/new"
    else 
      Review.create(content: params[:content], car_id: params[:book_id], user_id: current_user.id)
      redirect "/books/#{@book.id}"
    end 
  end 

  






end 