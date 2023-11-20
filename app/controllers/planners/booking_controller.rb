class Planners::BookingController < ApplicationController
    def index
        @workshops=current_planner.workshops.all
        @workshop=Workshop.find_by(id:params[:workshop_id])
      end
end
