class UserWorkshopsController < ApplicationController
  include UserSessionsHelper 
  def create
        #user_idをcurrent_user.idに入れますよ。
        #workshop_idをparamsに追加します。
        user_workshop = UserWorkshop.create(user_id: current_user.id, workshop_id: params[:workshop_id])
         p"============"
         p @user_workshop.errors.full_messages
         p"============"
        redirect_to users_workshops_show_path(params[:workshop_id])
  end
end
