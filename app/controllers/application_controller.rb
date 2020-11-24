class ApplicationController < ActionController::Base

    #this line will make the current method available to the all controlers and also to the views 
    helper_method :current_user, :logged_in?  

    def current_user
        #this will return the current_user if it already exist without hitting the database
        #but if the current user does not exist it will hit the database and find the session for a user searching after his user_id(the the user exists)
        #in this way the application will work more eficient because every time when the user is needed then it wwill verify if it was already searched and found 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        #this line will trasform the value into a "boolean" and this method will return true or false
        #so it will return true or false if a current user is already logged in 
        !!current_user
    end

end
