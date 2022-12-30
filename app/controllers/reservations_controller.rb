class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end
  def create
    @reservation = current_user.reservations.create(reservation_params)
     redirect_to reservations_index_path notice:"予約が完了しました"
  end
  def new
  end

  def show
  end
  def reservation_params
    params.require(:reservation).permit(:start_time, :day, :time,:workshop_id,:user_id)
  end 
 
end
