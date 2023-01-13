class Users::ReservationsController < ApplicationController
  include  UserSessionsHelper
  def index
    @reservation=Reservation.find_by(id:params[:id])
  end
  def new
    @reservation=Reservation.new
    @reservation=Reservation.find_by(id:params[:id])
    @workshop = Workshop.find_by(params[:workshop_id])
    
  end
  def create

    @reservation =current_user.reservations.build(reservation_params)
   # @reservation=current_user.reservations.create(reservation_params)
    p"============"
    p @reservation.errors.full_messages
    p params
    p"============"
    if @reservation.save!
      flash[:notice] = "This reservation is succesfully created."
      redirect_to users_reservations_show_path(params[:workshop_id])
    else
      flash[:alert] = "This reservation failed to be created."
      render :new
    end
  end    
  def show 
    @reservation=Reservation.find_by(id:params[:id])
    @workshop=Workshop.find_by(id:params[:workshop_id])
  end
  def edit
      @reservation=Reservation.find_by(id:params[:workshop_id])
  end
  def  update
      @reservation=Reservation.find_by(id:params[:workshop_id])
      if @reservation.update(reservation_params)  #workshop_paramsの内容を上書きする。
          flash[:notice]="プランナー情報を更新しました。"
          redirect_to users_reservations_show_path(params[:workshop_id]),data: {"turbolinks" => false}
      else
        render :edit
      end
  end
  def destroy
      @reservation=Reservation.find_by(id:params[:workshop_id])
      @reservation.destroy
      redirect_to users_reservations_show_path(@reservation,params[:worshop_id])
  end
    private
    def reservation_params
      params.require(:reservation).permit(:name,:participant,:date_time_1,:workshop_id,:date_time_2,:date_time_3,:user_id,:check_box)
    end 
  end
