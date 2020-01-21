class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? #gives access to these methods in the views


    private 

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id] #set current user if there is current user, otherwise if there is a session set the current User to the User with a matching id
    end 

    def logged_in?
        !!session[:user_id] #double band returns true if there is session
    end 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in? #do not want not logged on people accessing anything but the root route 
    end 
end
