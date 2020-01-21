class BooksController < ApplicationController

    def index
        @books = current_user.books.alpha
    end 
    
    def new
        @book = Book.new
    end 

    def create
        @book = current_user.books.build(book_params) #book created belongs to the the current user
        if @book.save 
            redirect_to books_path(@book) #if the book saves there haven't been any errors, so can show all the books
        else 
            render :new #have to retry entering information
        end 
    end 

    def show 
        @book = Book.find_by(id: params[:id])
    end 

    def edit
        @book = Book.find(params[:id])
    end

    def update 
        @book = Book.find_by(id: params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
         render :edit
        end
    end 

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end 

    private
    def book_params
        params.require(:book).permit(:title, :author, :genre, :blurb) #specify the only information we want to allow in
    end 
end
