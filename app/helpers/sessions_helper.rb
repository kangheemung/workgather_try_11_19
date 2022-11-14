module SessionsHelper
  def current_planner
    @current_planner||= Planner.find_by(id: session[:planner_id])
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?(planner)
    !current_planner.nil?
  end
  def logged_in?(user)
    !current_user.nil?
  end
end