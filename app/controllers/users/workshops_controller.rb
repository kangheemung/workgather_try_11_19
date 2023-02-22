class Users::WorkshopsController < ApplicationController
  include  UserSessionsHelper
    def index
      @workshops = Workshop.all
     "=======check================"
     p params
     "========================="
    end  
    def new
      
      @post=Post.new
      @workshop =Workshop.find_by(id: params[:workshop_id])
      "=======check================"
      p params
      "========================="
      
    end
    def show
     @reservation=Reservation.find_by(id: params[:r_id])
     @workshop =Workshop.find_by(id: params[:workshop_id])
     @user =User.find_by(id:params[:user_id])
     @post=Post.new
     @posts=Post.all
     @star =Star.new
    end
    def edit
      @workshop =Workshop.find_by(id: params[:workshop_id])
      @post=Post.find(params[:id])
    end
    def update
      @post=Post.find(params[:id])
      if @post.update(post_params)
          #  session[:planner_id]=planner.id
          flash[:notice]="参加者レビュー情報を更新しました。"
          redirect_to planners_workshops_show_path(@post.workshop_id)
      else
        render :edit
      end
    end
    
    private
    def post_params
      params.require(:post).permit(:title,:content,:image,:workshop_id,:score, :user_workshop_id)
    end 
  end
