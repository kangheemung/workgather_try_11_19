module UserSessionsHelper
 def log_in(user)
   session[:user_id] =user.id
 end
 def logged_in?(user)
    !current_user.nil?
 end
 def log_out(user)
    session.delete(:user_id)
    @current_user = nil
 end
end
