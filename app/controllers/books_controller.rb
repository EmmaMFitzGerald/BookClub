class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @books = Book.all
    end 
    
    def new
        @book = Book.new
    end 

    def create
        @book = current_user.books.build(book_params) #book created belongs to the the current user
        if @book.save 
            redirect_to book_path(@book.id) #if the book saves there haven't been any errors, so can show all the books
        else 
            render :new #have to retry entering information
        end 
    end 

    def show 
        if logged_in?
            @book = Book.find_by(id: params[:id])
        else
            redirect_to '/'
        end 
    end 

    def edit
        @book = Book.find(params[:id])
        redirect_to books_path if !@book || @book.user != current_user #have to have added the book to edit
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
        if !@book || @book.user != current_user #can only delete your own books
            redirect_to books_path 
        else
            @book.destroy
            redirect_to books_path #reloads the page to display updated list
        end 
    end 

    def search
        if params[:search].blank?  
          redirect_to('/', alert: "Empty field!") and return  
        else  
          @parameter = params[:search].downcase  
          @results = Book.search(@parameter)
        end  
    end 

    private
    def book_params
        params.require(:book).permit(:title, :author, :genre, :blurb, :search) #specify the only information we want to allow in
    end 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in? #do not want not logged on people accessing anything but the root route 
    end 
end
