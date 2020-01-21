class CommentsController < ApplicationController
    def index
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
        #checks if the route is nested by determing the book_id then sets the book
            @comments = @books.comments 
        else
            @comments = Comment.all
        end 
    end 

    def new
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            #checks if the route is nested by determing the book_id then sets the book
            @comment = @book.comments.build
        else 
            @error = "This book doesn't exist" if params[:book_id]
            @comment = Comment.new
        end 
    end 

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else 
            render :new 
        end 
    end 

    def show 
        @book = Book.find_by_id(params[:book_id])
        @comments = @book.comments
    end 

    def edit
        @comment = Comment.find_by(id: params[:id])
    end 

    def update
        @comment = Comment.find_by(id: params[:id])  
    end 

    private
    def comment_params
        params.require(:comment).permit(:chapter, :content, :book_id) #specify the only information we want to allow in
    end 
end
