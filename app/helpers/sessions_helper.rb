module SessionsHelper
    def log_in(user)
        session[:user_id] =user.id
    end
    def log_in(planner)
        session[:planner_id]=planner.id
    end
    # Returns the current logged-in user (if any).
    def current_planner
    @current_planner||= Planner.find_by(id: session[:planner_id])
    end
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # Returns true if the user is logged in, false otherwise.
    def logged_in?(user)
    !current_user.nil?
    end
    
    def logged_in?(planner)
    !current_planner.nil?
    end
    
    def log_out(user)
    session.delete(:user_id)
    @current_user = nil
    end
    
    def log_out(planner)
    session.delete(:planner_id)
    @current_planner = nil
    end
end
    

