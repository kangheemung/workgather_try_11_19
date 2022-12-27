class Users::WorkshopsController < ApplicationController
  include  UserSessionsHelper
    def index
      @workshops = Workshop.all
      @posts=Post.all
      
    end  
    def new
      @posts=Post.all
      @post=Post.new
      @post=Post.new
      @workshop =Workshop.new
      
    end
    def show
     @workshop =Workshop.find_by(id:params[:id])
     @post=Post.new
     @posts=Post.all
     @star =Star.new
    end
    def edit
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
      params.require(:post).permit(:title,:content,:image,:workshop_id,:score )
    end 
  end
