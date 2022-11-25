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
        redirect_to planners_show_path(planner.id)
      else
      render :new
    end
  end
  def mypage
    @planner = Planner.find_by(id: params[:id])
    @workshop = Workshop.find_by(id:params[:id])
  end
  def show
    @planner = Planner.find_by(id: params[:id])
  end
  def edit 
    @planner = Planner.find_by(id: params[:id])
  end
  def update
    @planner=Planner.find_by(id: params[:id])
    if @planner.update(update_planner_params)
        #  session[:planner_id]=planner.id
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to planners_show_path(@planner.id)
    else
      render :edit
    end
 end
private
  def update_planner_params
    params.require(:planner).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender,:workshop_id)
  end
  def planner_params
    params.require(:planner).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender,:workshop_id)
  end
end
