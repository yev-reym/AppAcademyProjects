class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in
        redirect new_session_url unless self.logged_in?
    end

    def login!(user) 
        current_sesh_token = user.reset_session_token!
        session[:session_token] = current_sesh_token
        @current_user = user
    end

    def logout!
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
    end

    def logged_in?
        !!current_user
    end
end
