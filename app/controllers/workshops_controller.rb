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
    params.require(:workshop).permit(:w_title,:w_theme,:firstname,:lastname,:f_name_E,:l_name_E,:image)
  end 
end
