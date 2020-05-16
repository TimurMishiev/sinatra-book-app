class CreateUsersBooksReviews < ActiveRecord::Migration
   def change
     
     create_table :users do |t|
       t.string :name
       t.string :password_digest
    end 
    
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :genre
    end
  
      create_table :reviews do |t|
        t.text :content
        t.integer :user_id
        t.integer :book_id
      end

    
  end
end
