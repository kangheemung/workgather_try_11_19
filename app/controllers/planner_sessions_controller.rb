class PlannerSessionsController < ApplicationController
  include  PlannerSessionsHelper
  def new
  end
  def create
      planner = Planner.find_by(email: params[:planners][:email].downcase)
      if planner && planner.authenticate(params[:planners][:password])
        log_in(planner)
        flash[:notice]="ログインしました。"
        redirect_to("/posts/index")
      else
        redirect_to planner_login_path
      end
  end
  def destroy
    session[:user_id]= nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
end
