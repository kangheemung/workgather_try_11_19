class ReservationsController < ApplicationController
  include  UserSessionsHelper
  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path @reservation.id
    else
      render :new
    end

  end
  def new
    @reservation=Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
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
