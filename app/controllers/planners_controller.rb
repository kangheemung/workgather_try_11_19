class PlannersController < ApplicationController
  def new
    @planner=Planner.new
  end
  def create
    planner=Planner.new(planner_params)
    if planner.save
      log_in(planner)
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end
  def delete
  end
  
  private
  def planner_params
    params.require(:planner).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender)
  end
end
