class Users::ReservationsController < ApplicationController
  include  UserSessionsHelper
  def index
    user=User.find_by(id: params[:user_id])
    @reservations=user.reservations.all
    
    
  end
  
  def new
    @reservation=Reservation.new

    
  end
  def create

    user=User.find(session[:user_id])
    reservation=user.reservations.create(reservation_params)
   p"============"
    p reservation
    p @workshop
    p "urlのIDは#{params[:workshop_id]}"
    p "入力された値は#{params[:reservation_id]}"
    p"============"

    if reservation.save!
      
      p"============"
      p reservation
      p @workshop
      p "urlのIDは#{params[:workshop_id]}"
      p "入力された値は#{params[:reservation_id]}"
      p"============"

      flash[:notice] = "This reservation is succesfully created."
      redirect_to users_reservations_show_path(user.id, user.reservations.ids)
    else
      flash[:alert] = "This reservation failed to be created."
      render :new
    end
  end    
  def show 
    p "=======show_starts============"
    p params
    p"==============end====="
    user=User.find_by(id: params[:user_id])
    @reservation=user.reservations.find_by(id: params[:reservation_id])
    
    p "=======show_starts============"
    p params
    p @workshop
    p"==============end====="
    
  end
  def edit
    p "==================="
    p params
    
    p"==================="
   
    @reservation=Reservation.find_by(id: params[:reservation_id])
    p "=========edit=========="
    p params
    p @reservation
    p"============edit end======="
     
  end
  def  update 
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
      @reservation=Reservation.find_by(id: params[:reservation_id])
      @reservation.destroy
      redirect_to users_reservations_show_path(current_user)
    
  end
    private
    def reservation_params
      params.require(:reservation).permit(:name,:participant,:date_time_1,:date_time_2,:date_time_3,:check_box,).merge(user_id: current_user.id ,workshop_id: params[:workshop_id])
    end 
  end
