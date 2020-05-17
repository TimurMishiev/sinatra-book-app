class BooksController <  ApplicationController

  get '/books' do
    @books = Book.all
    erb :'books/index'
  end 

  get '/books/new' do
     if logged_in?
       erb :'books/new'
     else redirect '/login'
    end 
  end 

  post '/books' do
    if !params[:book_name].empty?
      book = Book.find_or_create_by(name: params[:book_name], author: params[:book_author], genre: params[:book_genre])
      redirect "/books/#{book.id}"
    else 
      redirect '/books/new'
    end 
  end 


  get '/books/:id' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/show'
  end


end 