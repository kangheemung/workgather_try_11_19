class Users::ReservationsController < ApplicationController
  include  UserSessionsHelper
  def index
   
    @reservations=current_user.reservations.all
   
    
  end
  
  def new
    @reservation=Reservation.new
    @workshop = Workshop.find_by(id: params[:workshop_id])
    @user=User.find_by(id: params[:user_id])
    
  end
  def create

    @reservation=current_user.reservations.create(reservation_params)
   p"============"
    p @reservation
    p @workshop
    p "urlのIDは#{params[:workshop_id]}"
    p "入力された値は#{params[:reservation_id]}"
    p"============"

    if @reservation.save!
      
      p"============"
      p @reservation
      p @workshop
      p "urlのIDは#{params[:workshop_id]}"
      p "入力された値は#{params[:reservation_id]}"
      p"============"

      flash[:notice] = "This reservation is succesfully created."
      redirect_to users_reservations_show_path(current_user,@reservation.id)
    else
      flash[:alert] = "This reservation failed to be created."
      render :new
    end
  end    
  def show 
    p "=======show_starts============"
    p params
    p"==============end====="
   
    @reservation=current_user.reservations.find_by(id: params[:reservation_id])
    @workshop=Workshop.find_by(id: params[:workshop_id])
    p "=======show_starts============"
    p params
    p"==============end====="
    
  end
  def edit
    p "==================="
    p params
    
    p"==================="
   
    @reservation=Reservation.find_by(id: params[:reservation_id])
    
    p "==================="
    p params
    p @reservation
    p"==================="
     
  end
  def  update 
      if @reservation =current_user.reservations.update(reservation_params)
         #workshop_paramsの内容を上書きする。
          flash[:notice]="プランナー情報を更新しました。"
          redirect_to users_reservations_index_path(current_user),data: {"turbolinks" => false}
      else
        render :edit
      end
  end
  def destroy
      @reservation=Reservation.find_by(id: params[:r_id])
      @reservation.destroy
      redirect_to users_reservations_show_path(current_user)
    
  end
    private
    def reservation_params
      params.require(:reservation).permit(:name,:participant,:date_time_1,:date_time_2,:date_time_3,:check_box,).merge(user_id: current_user.id ,workshop_id: params[:workshop_id])
    end 
  end
