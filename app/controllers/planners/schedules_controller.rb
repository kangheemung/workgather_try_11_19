class Planners::SchedulesController < ApplicationController
  def index
    @schedules=Schedule.all
  end
  def new
    @schedules=Schedule.all
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
      redirect_to planners_schedules_new_path
    else  
      render "new"
    end
  end

  def show
    @workshop =Workshop.find_by(id: params[:workshop_id])
    @schedule= Schedule.new
  end

  def edit
  end
  private
  def schedule_params
    params.require(:schedule).permit(:planner_id,:workshop_id,:title,:content,:day,:time,:start_time)
  end 
end
