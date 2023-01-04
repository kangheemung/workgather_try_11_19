class Planners::SchedulesController < ApplicationController
  def index
    @schedules=Schedule.all
  end
  def new
  
  end
  def create
    if @schedule= Schedule.create(schedule_params)
      p"========"
      p @schedule.errors.full_messages
      p"==========="
      redirect_to planners_schedules_show_path(:workshop_id)
    else
      render :new
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
