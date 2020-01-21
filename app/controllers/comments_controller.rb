class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update]

    def index
        @comments = current_user.comments
        # if params[:book_id] && @book = Book.find_by_id(params[:book_id])
        #checks if the route is nested by determing the book_id then sets the book
            # @comments = @books.comments.order_by_chapter
        # else
            # @comments = Comment.all.order_by_chapter
        # end 
    end 

    def new
        @books = current_user.books #will be used to check the user has a book to add notes to
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
        #    if @book = current_user.books.find_by_id(params[:book_id])
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
            redirect_to book_comments_path(@comment.book.id)
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
        if !@comment || @comment.user != current_user
            redirect_to comments_path 
        end
    end 

    def update
        if !@comment || @comment.user != current_user
            if @comment.update(comment_params) 
                redirect_to book_comments_path(@comment.book.id) #pass in the book id as an argument
            else
                render :edit
            end
        end
    end 

    def destroy
        @comment = Comment.find(params[:id])
        if !@comment || @comment.user != current_user #if comment returns fault, or if the current user did not make the comment, comment can not be deleted
            redirect_to book_comments_path(@comment.book.id)
        else
            @comment.destroy #if it passes those checks and the comment belongs to the user, then the comment can be deleted
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
