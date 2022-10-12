class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
    user = User.new(user_params)
    if user.save
      #session[:user_id]=user.id
      login(user)
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @user=User.find(1)
  end
  def delete
  end

  private
   def user_params
       params.require(:user).permit(:name,:email,:password,:password_confirmation)
   end
end
