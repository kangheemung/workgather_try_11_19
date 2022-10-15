class SessionsController < ApplicationController
  def new
  end
  def create
    #p "=============="
    #p params
    #p "=============="
     user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      # session[:user_id] = user.id
      log_in(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end
    p "========="
    params
    p "========="
  end
  def destroy
     session[:user_id] = nil
     redirect_to root_path
  end
end
