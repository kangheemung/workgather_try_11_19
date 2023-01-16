class Planners::ReservationsController < ApplicationController
  def index
    @workshops=current_planner.workshops.all
    
  end
end
