class WorkshopsController < ApplicationController
  include  PlannerSessionsHelper
  def index
    @workshops=Workshop.all
  end

  def new
    @workshop=Workshop.new
    
  end
  def create
     #p "params: #{params}"
     @workshop = Workshop.new(workshop_params)
     @workshop.planner_id=current_planner.id
     if @workshop.save
       redirect_to ("/workshops/index")
     else
       render "new"
     end
  end
  def show
  end
  private
  def workshop_params
    params.require(:workshop).permit(:w_title,:w_theme,:firstname,:lastname,:f_name_E,:l_name_E,:image,:prefecture,:address1,:address2,:planner_id,:w_detail,:p_text,:p_detail,:profile_img,:time,:personnel,:precautions)
  end 
end
