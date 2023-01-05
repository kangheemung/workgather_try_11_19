class Users::ReservationsController < ApplicationController
  include  UserSessionsHelper
  def index
    @reservations = current_user.reservations.all
  end
  def new
    @reservation = Reservation.new
  end
  def create
    reservation= current_user.reservations.build(reservation_params) 
    p"============"
    p @reservation.errors.full_messages
    p"============"
    if reservation.save!
      redirect_to users_reservation_index_path 
    else
      render :new
    end
  end    
  def show
    @workshop=Workshop.find_by(id:params[:workhshop_id])
    @reservation=Reservation.find_by(params[:reservation_id])
  end
    def edit
      @reservation=Reservation.find_by(params[:id])
    end
    def  update
      @reservation=Reservation.find(params[:id]) #値を取得する
      if @reservation.update(reservation_params)  #workshop_paramsの内容を上書きする。
        
          flash[:notice]="プランナー情報を更新しました。"
          redirect_tou users_reservations_show_path(@reservation.workshop_id),data: {"turbolinks" => false}
      else
        render :edit
      end
    end
    private
    def reservation_params
      params.require(:reservation).permit(:day,:time,:workshop_id,:user_id,:start_time)
    end 
  end
