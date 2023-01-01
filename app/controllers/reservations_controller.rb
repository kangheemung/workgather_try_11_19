class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to reservation_index_path notice:"予約が完了しました"
    end
  def new
    @reservation=Reservation.new

  end

  def show
    @reservation=Reservation.find(params[:id])
  end
  def edit
    @reservation=Reservation.find_by(params[:id])
  end
  def  update
    @reservation=Reservation.find_by(params[:id]) #値を取得する
    if @reservation.update(reservation_params)  #workshop_paramsの内容を上書きする。
      
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to workshops_show_path(@reservation.id),data: {"turbolinks" => false}
    else
      render :edit
    end
  end
  def reservation_params
    params.require(:reservation).permit(:start_time, :day, :time,:workshop_id,:user_id)
  end 
 
end
