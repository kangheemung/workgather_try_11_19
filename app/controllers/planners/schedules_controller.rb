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
      redirect_to planners_schedules_show_path
    else  
      render "new"
    end
  end

  def show
    @schedules =Schedule.new
    @planner = Planner.find_by(id:params[:planner_id])
    @workshop =Workshop.find_by(id: params[:workshop_id])
    
  end

  def edit
  end
  private
  def schedule_params
    params.require(:schedule).permit(:planner_id,:workshop_id,:title,:content,:day,:time,:start_time)
  end 
end
