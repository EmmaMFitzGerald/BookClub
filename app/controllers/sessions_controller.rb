class SessionsController < ApplicationController

    def home
    end 

    def destroy
        sessions.clear #clear the sessions hash
        redirect_to root_path #redirect to homepage once logged out
    end

    def create
        @user = User.find_by(username: params[:user][:username])#look for the user based on username
        if @user && @user.authenticate(params[:user][:password])#if we find the user AND the password is right
            session[:user_id] = @user.id #create a new session id
            redirect_to user_path(@user) #bring the user to their show page
        else 
            flash[:message] = "Incorrect info, please try again!"
            redirect_to '/login' #rerender log-in page
        end 
    end 
end