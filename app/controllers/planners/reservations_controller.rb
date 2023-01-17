class Planners::ReservationsController < ApplicationController
  def index
    @workshops=current_planner.workshops.all
    @workshop=Workshop.find_by(params[:workshop_id])
  end
end
