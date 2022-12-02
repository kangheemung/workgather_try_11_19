class UsersController < ApplicationController
include  UserSessionsHelper
 before_action :set_user, only: %i[edit update]
  def index
    @users=User.all
  end
  def new
    @user=User.new
  end
  def create
    user = User.new(user_params)
    if user.save
      #session[:user_id]=user.id
      log_in(user)
      flash[:notice]="ユーザー登録が完了しました"
      redirect_to users_show_path(user.id)
    else
      render :new
    end
  end
  def show
    @user=User.find_by(id: params[:id])
  end
  def edit
    @user=User.find_by(id: params[:id])
  
    p"============"
    p @user.errors.full_messages
    p"============"
  end
  def update
    #p"============"
     #   p @user.errors.full_messages
    #p"============"
    @user=User.find_by(id: params[:id])
    if @user.update(user_params)
        #  session[:user_id]=user.id
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to users_show_path(@user.id) ,data: {"turbolinks" => false}
    else
      render :edit
    end
  end
private
def set_user
  @user=User.find(current_user.id)
end
 def user_params
      params.require(:user).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender,:u_profile_id)
  end
end
