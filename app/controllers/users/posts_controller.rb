class Users::PostsController < ApplicationController
  include  UserSessionsHelper
  def new
    @user = current_user
    
    @reservation = Reservation.find_by(workshop_id: params[:workshop_id], user_id: @user.id)
    
    if @reservation.nil?
      flash[:alert] = "You cannot review a workshop you didn't participate in."
      redirect_to users_workshops_index_path
      return
    end
    # Find the workshop using the workshop_id from the params
    @workshop = Workshop.find(params[:workshop_id])
    
    # Initialize a new post with just the workshop_id and user_id set
    @post = Post.new(workshop_id: @workshop.id, user_id: @user.id)

    # Optional: Get all posts for the workshop if needed to display elsewhere
    @posts = @workshop.posts
  end
  def create
    @post = current_user.posts.build(post_params)
    @post.save
      redirect_to users_workshops_index_path # Ensure this is also correctly defined route
    
    
  end

    def edit
      @post = Post.find(params[:post_id])
    end
    def update
      @post = Post.find(params[:post_id])

      if @post.update(post_params)
        flash[:notice] = "参加者レビュー情報を更新しました。"
        redirect_to posts_show_path(@post.id)
          #  session[:planner_id]=planner.id
          flash[:notice]="参加者レビュー情報を更新しました。"
      else
        render :edit
      end
    end
    private
    def post_params
      params.require(:post).permit(:title,:content,:image,:workshop_id,:score,:user_id,:user_workshop_id).merge(user_id: current_user.id)
    end 
  end