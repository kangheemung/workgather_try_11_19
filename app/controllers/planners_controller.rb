class PlannersController < ApplicationController
  def index
    @planners= Planner.all
  end
  def new
    @planner=Planner.new
  end
def create
  planner = Planner.new(planner_params)
   if planner.save
      log_in(planner)
      #  session[:planner_id]=planner.id
      flash[:notice]="ユーザー登録が完了しました。"
      redirect_to("/planners/login_form")
    else
    render :new
  end
end
def show
  @planner=Planner.find_by(id: params[:id])
end
def login_form
end
def login
    planner = Planner.find_by(email: params[:planners][:email].downcase)
    if planner && planner.authenticate(params[:planners][:password])
      log_in(planner)
      flash[:notice]="ログインしました。"
      redirect_to("/posts/index")
    else
      redirect_to planner_login_path
    end
end
def logout
  session[:user_id]= nil
  flash[:notice]="ログアウトしました"
  redirect_to("/login")
end
  private
  def planner_params
    params.require(:planner).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender)
  end
end
