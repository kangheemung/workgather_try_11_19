module UserSessionsHelper
 def log_in(user)
   session[:user_id] =user.id
 end
 def logged_in?(user)
    !current_user.nil?
 end
end
