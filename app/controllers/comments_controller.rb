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
        @comment = Comment.new
    end 

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comment_path
        else 
            render :new 
        end 
    end 

    def show 
        @comment = Comment.find_by(id: params[:id])
    end 

    def edit
        @comment = Comment.find_by(id: params[:id])
    end 

    def update
        @comment = Comment.find_by(id: params[:id])  
    end 
end
