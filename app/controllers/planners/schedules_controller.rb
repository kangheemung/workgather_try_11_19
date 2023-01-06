class Planners::SchedulesController < ApplicationController
  def index
    @schedules=Schedule.all
    @workshop =Workshop.find_by(id: params[:workshop_id])
   

  end
  def new
    @workshop =Workshop.find_by(id: params[:workshop_id])
    @schedule= Schedule.new
  end
  def create
    schedule= Schedule.new(schedule_params)
      p"========"
      p params
      p schedule.errors.full_messages
      p"==========="
    if schedule.save
      redirect_to planners_schedules_show_path(id: params[:workshop_id])
    else  
      render "new"
    end
  end
  def show
    @schedule =Schedule.find_by(params[:id])
    @planner = Planner.find_by(params[:planner_id])
    @workshop =Workshop.find_by(id: params[:workshop_id])
  
    
  end
  def  update
    @schedule=Schedule.find(params[:id]) #値を取得する
    if  @schedule.update(schedule_params)  #workshop_paramsの内容を上書きする。
      
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to planners_schedules_show_path(@schedule.workshop_id),data: {"turbolinks" => false}
    else
      render :edit
    end
  end
  def edit
    @schedule =Schedule.find_by(params[:id])
  end
  private
  def schedule_params
    params.require(:schedule).permit(:title,:content,:start_time,:end_time,:workshop_id,:start_date,:planenr_id)
  end 
end
