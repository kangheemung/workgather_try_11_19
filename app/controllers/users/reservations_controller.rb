class Users::ReservationsController < ApplicationController
  include  UserSessionsHelper 
  def index
      @reservations = Reservation.all
    end
    def create
      @reservation= Reservations.new(reservation_params) 
      if @reservation.save!
        redirect_to users_reservations_show_path, notice:"予約が完了しました"
      else
        render :new
      end
    end
    def new
      @reservation = Reservation.new
     
    end
    def show
      @workshop=Workshop.find_by(id:params[:id])
      @reservation=Reservation.find_by(id:params[:id])
    end
    def edit
      @reservation=Reservation.find_by(params[:id])
    end
    def  update
      @reservation=Reservation.find_by(params[:id]) #値を取得する
      if @reservation.update(reservation_params)  #workshop_paramsの内容を上書きする。
        
          flash[:notice]="プランナー情報を更新しました。"
          redirect_tou users_reservations_show_path(@reservation.id),data: {"turbolinks" => false}
      else
        render :edit
      end
    end
    def reservation_params
      params.require(:reservation).permit( :day, :time,:workshop_id,:user_id)
    end 
   
  end
