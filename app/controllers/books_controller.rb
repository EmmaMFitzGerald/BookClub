class BooksController < ApplicationController

    def new
        @book = Book.new
    end 

    def create
        @book = current_user.books.build(book_params) #book created belongs to the the current user
        if @book.save 
            redirect_to books_path #if the book saves there haven't been any errors, so can show all the books
        else 
            render :new #have to retry entering information
        end 
    end 

    private
    def book_params
        params.require(:book).permit(:title, :author, :genre, :blurb) #specify the only information we want to allow in
    end 
end
