class WorkshopsController < ApplicationController
  include  PlannerSessionsHelper
  def index
    @workshops = Workshop.all
    @workshop=Workshop.new
  end
  def new
    @workshops = Workshop.all
    @planner=Planner.new
  end
  def create
     #p "params: #{params}"
     workshop = current_planner.workshops.build(workshop_params)
     if workshop.save
       redirect_to ("/workshops/index")
     else
       render "new"
     end
  end
  def show
  end
  
  private
  def workshop_params
    params.require(:workshop).permit(:w_title,:w_theme,:image,:prefecture,:address1,:address2,:planner_id,:w_detail,:p_text,:p_detail,:profile_img,:time,:personnel,:precautions)
  end 
end
