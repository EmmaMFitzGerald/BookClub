class UsersController < ApplicationController

    def new 
        @user = User.new #creates new instance of a user
    end 

    def create
        @user = User.new(user_params)
        if @user.save #the user has passed validations and can be created & logged in
            session[:user_id] = @user.id #creates a new session with that users id
            redirect_to @user #takes the user to their show page
        else #the user has not passed validations and needs to reenter information 
            render :new
        end 
    end 

    def show
        redirect_if_not_logged_in #do not let !logged_in people on to users show page
        @user = User.find_by_id(params[:id]) #show the signed in users show page
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :password) #determines what information can be sent through the form
    end 
end

