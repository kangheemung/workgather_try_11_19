class Users::PostsController < ApplicationController
  include  UserSessionsHelper
    def create
      @post=current_user.posts.build(post_params)
         @post.save!
          redirect_to user_workshops_index_path
      
        
       
    end
    def edit
      @post=Post.find_by(params[:id])
    end
    def update
      @post=Post.find_by(params[:id])
      if @post.update(post_params)
          #  session[:planner_id]=planner.id
          flash[:notice]="参加者レビュー情報を更新しました。"
          redirect_to users_workshops_show_path(@post.workshop_id)
      else
        render :edit
      end
    end
    private
    def post_params
      params.require(:post).permit(:title,:content,:image,:workshop_id,:score,:user_id,:user_workshop_id).merge(user_id: current_user.id)
    end 
  end