class Users::PostsController < ApplicationController
  include  UserSessionsHelper
  def index
    @workshop = Workshop.find_by(id:params[:workshop_id])
    @posts = @workshop.posts.all
    

  end
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
    user = current_user
    @workshop = Workshop.find(params[:workshop_id])
  
    # Build a new post (review) associated with the current user
    @post = user.posts.build(post_params)
  
    # For one-to-many relationship:
    @post.workshop_id = @workshop.id
    
    # For many-to-many relationship:
    # @post.workshops << @workshop
  
    if @post.save
      redirect_to users_posts_show_path(user_id: current_user.id, workshop_id: @post.workshop_id, post_id: @post.id), notice: 'レビューが正常に作成されました。'
    else
      puts @post.errors.full_messages 
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
      params.require(:post).permit(:title, :content, :image, :workshop_id,:user_workshop_id)
    end
  end