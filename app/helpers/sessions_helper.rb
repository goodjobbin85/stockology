module SessionsHelper
    
    def log_in(user)
        session[:user_id] = user.id
    end
  
    def log_out
      session[:user_id] = nil
    end
    
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token

    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    
end
