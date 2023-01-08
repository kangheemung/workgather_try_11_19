class Users::ReservationsController < ApplicationController
  include  UserSessionsHelper
  def index
    @reservations = Reservations.all
  end
  def new
    @workshop=Workshop.find_by(id:params[:workshop_id])
    @reservation = Reservation.new
  
  end
  def create
    reservation=current_user.reservations.build(reservation_params) 
    p"============"
    p reservation.errors.full_messages
    p"============"
    if reservation.save
      redirect_to users_reservations_show_path(id:params[:workhshop_id])
    else
      render :new
    end
  end    
  def show
    @user=User.find_by(params[:id])
    @workshop=Workshop.find_by(id:params[:workhshop_id])
    @reservation=Reservation.find_by(params[:id])
  end
    def edit
      @reservation=Reservation.find_by(params[:id])
    end
    def  update
      @reservation=Reservation.find(params[:id]) #値を取得する
      if @reservation.update(reservation_params)  #workshop_paramsの内容を上書きする。
        
          flash[:notice]="プランナー情報を更新しました。"
          redirect_to users_reservations_show_path(@reservation.workshop_id),data: {"turbolinks" => false}
      else
        render :edit
      end
    end
    private
    def reservation_params
      params.require(:reservation).permit(:name,:participant,:date_time_1,:workshop_id,:date_time_2,:date_time_3,:user_id,:check_box)
    end 
  end
