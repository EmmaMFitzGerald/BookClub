class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update]

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
            redirect_to book_comments_path
        else 
            render :new 
        end 
    end 

    def show 
        @book = Book.find_by_id(params[:book_id])
    end 

    def edit
        @comment = Comment.find(params[:id])
        @book = @comment.book
    end 

    def update
        if @comment.update(comment_params) 
            redirect_to book_comments_path(@comment.book.id) #pass in the book id as an argument
        else
            render :edit
        end
    end 

    private
    def comment_params
        params.require(:comment).permit(:chapter, :content, :book_id) #specify the only information we want to allow in
    end 

    def set_comment
        @comment = Comment.find_by(id: params[:id])
        if !@comment
          flash[:message] = "Comment was not found"
          redirect_to comments_path
        end
    end
end
