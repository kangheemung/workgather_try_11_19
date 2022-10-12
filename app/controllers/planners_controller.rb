class PlannersController < ApplicationController
  def new
    @planner=Planner.new
  end
  def create
    planner=Planner.new(planner_params)
    if planner.save
      login(planner)
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
    params.require(:planner).permit(:name,:email,:password,:password_confirmation)
  end
end
