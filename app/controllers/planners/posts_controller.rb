class Planners::PostsController < ApplicationController
  def index
    p "==========index start========="
    p params
    p @workshop
    p"==================="
    @workshops=current_planner.workshops.all
    @workshop = Workshop.find_by(id:params[:workshop_id])
    #p"========"
    #p @workshop.errors.full_messages
    #p"==========="
    @posts = @workshop.posts.all
    

  end
  def show
    
  end
end
