class BooksController <  ApplicationController

  get '/books' do
    @books = Book.all
    erb :'books/index'
  end 

  get '/books/new' do
     if logged_in?
       erb :'cars/new'
     else redirect '/login'
    end 
  end 

  post '/books' do
    if !params[:car_name].empty?
      book = Book.find_or_create_by(name: [:book_name], author: params[:book_author], genre: params[:book_genre])
      redirect "/books/#{book.id}"
    else 
      redirect '/cars/new'
    end 
  end 



end 