class Users::UserSessionsController < ApplicationController
  include UserSessionsHelper 
    def new
    end
    def create
        user = User.find_by(email: params[:user][:email].downcase)
        if user && user.authenticate(params[:user][:password])
          log_in(user)
          flash[:notice]="ログインしました。"
          redirect_to users_workshops_index_path
      else
          flash[:danger] = 'Invalid email/password combination'
          redirect_to users_login_path
      end
    end
    def destroy
      session[:user_id]= nil
      flash[:notice]="ログアウトしました"
      redirect_to root_path
    end 
end
