class Users::PostsController < ApplicationController
  include  UserSessionsHelper
  def index
    @workshop = Workshop.find_by(id:params[:workshop_id])
    @posts = @workshop.posts.all
  end
  def create
    @workshop = Workshop.find(params[:workshop_id])
    # Build a new Post associated with the current_user
    @post = current_user.posts.build(post_params)
  
    # Try saving the Post and WorkshopPost transactionally if valid
    if @post.valid?
      ActiveRecord::Base.transaction do
        @post.save!
        # Create the association with the workshop
        WorkshopPost.create!(workshop_id: @workshop.id, post_id: @post.id)
      end
      redirect_to users_workshops_index_path
    else
      render :new
    end
  end
  
  
  
  def show
    @workshop = Workshop.find(params[:workshop_id])
    user = current_user
    @post = user.posts.find_by(id: params[:post_id])
  
  end

    def edit
      @post = Post.find(params[:post_id])
    end
    def update
      @post = Post.find(params[:post_id])
    
      if @post.update(post_params)
        flash[:notice] = "参加者レビュー情報を更新しました。"
        redirect_to posts_show_path(current_user,@post.id)
          #  session[:planner_id]=planner.id
          flash[:notice]="参加者レビュー情報を更新しました。"
      else
        render :edit
      end
    end
    private

    def post_params
      # Strong parameters – Allows title, content, image, score, and ensures user_id is not tampered with.
      params.require(:post).permit(:title, :content, :image, :workshop_id)
    end
  end