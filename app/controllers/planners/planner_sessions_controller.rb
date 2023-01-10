class Planners::PlannerSessionsController < ApplicationController
    include  PlannerSessionsHelper
    def new
    end
    def create
        planner = Planner.find_by(email: params[:planner][:email].downcase)
        if planner && planner.authenticate(params[:planner][:password])
          log_in(planner)
          flash[:notice]="ログインしました。"
          redirect_to planners_show_path(planner.id)
        else
          flash[:danger] = 'Invalid email/password combination'
          redirect_to planners_login_path
        end
    end
    def destroy
      session[:planner_id]= nil
      flash[:notice]="ログアウトしました"
      redirect_to root_path
    end
end

