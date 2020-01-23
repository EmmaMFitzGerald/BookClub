class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update] #find the comment before editing/updating
    before_action :redirect_if_not_logged_in

    def index
        @comments = current_user.comments #only want to see the current user's comments
    end 

    def new
        @book = Book.find_by_id(params[:book_id])
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
        @book = Book.find_by_id(params[:book_id])
        if @comment.save
          redirect_to book_path(@comment.book_id)
        else
          render :new
        end
    end
    
    def show
        @book = Book.find_by_id(params[:book_id])
    end 
    
    def edit
        @book = @comment.book
        redirect_to route_path if !@comment || @comment.user != current_user #can only edit your own comments
    end

    def update
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end 

    def destroy
        @comment = Comment.find(params[:id])
        @book = Book.find_by_id(params[:book_id])
        if !@comment || @comment.user != current_user #if can't find a comment, or if the current user did not make the comment, comment can not be deleted
            redirect_to book_comments_path(@comment.book.id)
        else
            @comment.destroy #if it passes those checks and the comment belongs to the user, then the comment can be deleted
            redirect_to book_comments_path(@comment.book.id) #reload page to show updated list
        end 
    end 

    private
    def comment_params
        params.require(:comment).permit(:chapter, :content, :book_id) #specify the only information we want to allow in
    end 

    def set_comment
        @comment = Comment.find_by(id: params[:id]) #finds the right comment
        if !@comment
          flash[:message] = "Comment was not found"
          redirect_to comments_path
        end
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in? #do not want not logged on people accessing anything but the root route 
    end 
end
