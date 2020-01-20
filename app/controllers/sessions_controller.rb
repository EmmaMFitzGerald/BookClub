class SessionsController < ApplicationController

    def home
    end 

    def destroy
        sessions.clear #clear the sessions hash
        redirect_to root_path #redirect to homepage once logged out
    end

    

end