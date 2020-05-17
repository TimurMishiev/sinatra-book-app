class ReviewsController < ApplicationController
    
  get '/reviews/:id/new' do
      if logged_in?
     erb:'reviews/new'
    end 
  end 



end 