class SessionsController < ApplicationController

    def home
    end 

    def destroy
        session.clear #clear the sessions hash, ending the session
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

    def google #find or create a user using the attrs sent by google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex #assigns random password to the user
        end 
        if @user.save 
            session[:user_id] = @user.id #set the session id which logs them in
            redirect_to user_path(@user)
        else 
            redirect_to '/' #if user doesn't save redirect to homepage
        end 
    end 

    private
    def auth
        request.env['omniauth.auth']
    end 
end