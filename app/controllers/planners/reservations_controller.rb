class Planners::ReservationsController < ApplicationController
  def index
  @workshop=Workshop.find_by(id:params[:workshop_id])
  end
end
