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
  def show  
    @planner = Planner.find(params[:id])
    @workshop = Workshop.find(params[:id])
   
      #p"========"
      #p @planner.errors.full_messages
      #p"==========="
  end
  def edit 
    @planner = Planner.find(params[:id])
    
  end
  def update
    @planner=Planner.find( params[:id])
    if @planner.update(planner_params)
        #  session[:planner_id]=planner.id
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to planners_show_path(@planner.id)
    else
      render :edit
    end
 end
private
  def planner_params
    params.require(:planner).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender,:workshop_id)
  end
end
