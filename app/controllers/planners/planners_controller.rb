class Planners::PlannersController < ApplicationController
include  PlannerSessionsHelper
    def index
      @planners= Planner.all
    end
    def new
      @planner=Planner.new
    end
    def create
      planner = Planner.new(planner_params)
      if planner.save
          #p"========"
        #p @planner.errors.full_messages
        #p"==========="
          log_in(planner)
          #  session[:planner_id]=planner.id
          flash[:notice]="ユーザー登録が完了しました。"
          redirect_to planners_show_path(planner.id)
        else
          @error_massage="入力内容もう一度確認してください"
        render :new
      end
    end
    def show  
      @planner = Planner.find(params[:planner_id])
      @workshop =Workshop.find_by(id:params[:workshp_id])
     
      
        #p"========"
        #p @planner.errors.full_messages
        #p"==========="
    end
    def edit 
      @planner = Planner.find(params[:planner_id])
    end
    def update
        @planner=Planner.find( params[:planner_id])
      if @planner.update(planner_params)
          #  session[:planner_id]=planner.id
          flash[:notice]="プランナー情報を更新しました。"
          redirect_to planners_show_path(@planner.id)
      else
      
        render :edit
      end
    end
    private
    def planner_params
      params.require(:planner).permit(:user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender,:planner_profile,:p_detail)
    end
  end 

