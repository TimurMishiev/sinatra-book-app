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
      Review.create(content: params[:content], book_id: params[:book_id], user_id: current_user.id)
      redirect '/books/1'
    end 
  end 

  get '/reviews/:id/edit' do
    @review = Review.find_by_id(params[:id])
    if @review && @review.user == current_user
      erb :'reviews/edit'
    else
      redirect "reviews/#{@book.id}"
    end 
  end 

  post 'reviews/:id/edit' do
    @review = Review.find_by_id(params[:id])
    if @review.user ==current_user
      @review.update(content: params[:content])
      redirect "/books"
    end
  end 





  end 