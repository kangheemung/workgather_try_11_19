class UsersController < ApplicationController
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
      redirect_to ("/login")
    else
      render :new
    end
  end
  def show
    @user=User.find_by(id: params[:id])
  end
  def login_form
  end
  def login
      user = User.find_by(email: params[:users][:email].downcase)
      if user && user.authenticate(params[:users][:password])
        log_in(user)
        flash[:notice]="ログインしました。"
        redirect_to("/posts/index")
    else
        redirect_to login_path
    end
  end
  def logout
    session[:user_id]= nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
  

  private
   def user_params
       params.require(:user).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender)
   end
end
