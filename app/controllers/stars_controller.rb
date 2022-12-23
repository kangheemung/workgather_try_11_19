class StarsController < ApplicationController
  def create
    workshop=Workshop.find(params[:workshop_id])
    current_user.stars(workshop)
    redirect_dack(fallback_location: root_path)
  end
end
