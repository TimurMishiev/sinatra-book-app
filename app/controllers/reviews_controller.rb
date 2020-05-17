class ReviewsController < ApplicationController
    get 'reviews/:id/new' do
      if logged_in?
        @book = Book.find_by_id(params[:id])
        erb :'reviews/new'
      else
        redirect '/login'
      end
    end 

    post '/reviews/:book_id' do
      @book = book_find_by_id(params[:book_id])
      if params [:content].empty?
        redirect "/review/#{@book.id}/new"
      else 
        Review.create(content: params[:content], book_id: params[:book_id], user_id: current_user.id)
        redirect "/books/#{@book.id}"
      end 
    end 


end 