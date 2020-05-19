class ReviewsController < ApplicationController

  get '/reviews/:id/new' do
  if logged_in?
    @book = Book.find_by_id(params[:id])
    erb :'/reviews/new'
  else
    flash[:alert] = "You have to be logged in in order to add review"
    redirect '/login'
  end
  end
  
  post '/reviews/:book_id' do
  @book = Book.find_by_id(params[:book_id])
  if params[:content].empty?
  flash[:alert] = "Please add a review."
  redirect "/reviews/#{@book.id}/new"
  else
  Review.create(content: params[:content], book_id: params[:book_id], user_id: current_user.id)
    redirect "/books/#{@book.id}"
  end
  end
  
  
  get '/reviews/:id/edit' do
    @review = Review.find_by_id(params[:id])
    if @review &&  @review.user == current_user
  erb :'reviews/edit'
  else
    flash[:alert] = 'You must be looged in as a different user to access that review'
    redirect "reviews/#{@book.id}"
    
  end
  end
  
  post '/reviews/:id/edit' do
  @review = Review.find_by_id(params[:id])
  if @review.user == current_user
    @review.update(content: params[:content])
    flash[:alert] = "Review updated successfully!"
    redirect "/books"
  
  end
  end
  
  get '/reviews/:id/delete'  do
    @review = Review.find_by_id(params[:id])
    if logged_in? && @review.user == current_user
    @review.delete
    redirect '/books'
  end
  end
  
  
  end