class PlannersController < ApplicationController
include  PlannerSessionsHelper
  def index
    @planners= Planner.all
  end
  def new
    @planner=Planner.new
  end
def create
  planner = Planner.new(planner_params)
   if planner.save
      log_in(planner)
      #  session[:planner_id]=planner.id
      flash[:notice]="ユーザー登録が完了しました。"
      redirect_to("/planners/login_form")
    else
    render :new
  end
end
def show
  @planner=Planner.find_by(id: params[:id])
end
  private
  def planner_params
    params.require(:planner).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender)
  end
end
