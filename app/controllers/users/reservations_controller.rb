class Users::ReservationsController < ApplicationController
  include  UserSessionsHelper
  def index
      @reservations = current_user.reservations.includes(:workshop).all    
  end
  
  
  def new
    @reservation=Reservation.new

    
  end
  def create
    user = current_user
    @workshop = Workshop.find(params[:workshop_id])
    @reservation = Reservation.new(reservation_params.merge(user_id: user.id, workshop_id: @workshop.id))
   p"============"
    p @reservation
    p @workshop
    p "urlのIDは#{params[:workshop_id]}"
    p "入力された値は#{params[:reservation_id]}"
    p"============"

    if @reservation.save
      
      p"============"
      p @reservation
      p @workshop
      p "urlのIDは#{params[:workshop_id]}"
      p "入力された値は#{params[:reservation_id]}"
      p"============"

      flash[:notice] = "予約が完了しました。"
      redirect_to users_reservations_show_path(user.id, user.reservations.ids)
    else
      flash[:alert] = "予約に失敗しました。"
      render :new
    end
  end    
  def show 
    p "=======show_starts============"
    p params
    p "==============end====="
    user = current_user
    @reservation = user.reservations.find_by(id: params[:reservation_id])
    
    p "=======show_starts============"
    p params
    p @reservation
    p "==============end====="
  end
  def edit
    @reservation = Reservation.find_by(id: params[:reservation_id])
  end
  
  def update 
    @reservation=Reservation.find_by(id: params[:reservation_id])
    if @reservation.update(reservation_params)
       #workshop_paramsの内容を上書きする。
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to users_reservations_index_path(current_user),data: {"turbolinks" => false}
    else
      render :edit
    end
  end
   
  def destroy
    @reservation = Reservation.find_by(id: params[:reservation_id])
  
    if @reservation
      @reservation.destroy
      redirect_to users_reservations_show_path(user_id: current_user.id), notice: "Reservation successfully destroyed"
    else
      redirect_to users_reservations_show_path(user_id: current_user.id), alert: "Reservation not found"
    end
  end
  
  

  
  
    private
    def reservation_params
      permitted_params = params.require(:reservation).permit(:name, :participant, :date_time_1, :date_time_2, :date_time_3, :check_box)
      permitted_params.merge!(user_id: current_user.id, workshop_id: params[:workshop_id]) if params[:workshop_id].present?
      permitted_params
    end
  end
