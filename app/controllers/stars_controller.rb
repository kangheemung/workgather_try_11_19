class StarsController < ApplicationController

def create
    @star =current_user.stars.create(workshop_id: params[:workshop_id])
    redirect_dack(fallback_location: root_path)
end

end
