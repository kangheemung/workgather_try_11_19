class Users::PostsController < ApplicationController
  include  UserSessionsHelper
    def index
      @workshop = Workshop.find_by(id:params[:workshop_id])
      @posts = @workshop.posts.all
    end
    
    def create
      @workshop = Workshop.find(params[:workshop_id])
      @post = current_user.posts.build(post_params.merge(workshop_id: @workshop.id))
    
      if @post.save
        WorkshopPost.create!(workshop_id: @workshop.id, post_id: @post.id)
        flash[:alert] = '投稿完了！' # 成功メッセージを設定
        redirect_to users_workshops_show_path(user_id: current_user.id, workshop_id: @workshop.id)
      else
        error_messages = [
          "タイトルは最低5文字必要です。",
          "内容は最低10文字必要です。",
          "画像をアップロードしてください。",
        ]
        flash[:alert] = error_messages.join("\n")
        redirect_to users_workshops_show_path(user_id: params[:user_id], workshop_id: params[:workshop_id])

      end
    end
    def show
      @workshop = Workshop.find(params[:workshop_id])
      user = current_user
      @post = user.posts.find_by(id: params[:post_id])
    
    end 
    def update
      @post = Post.find(params[:post_id])
    
      if @post.update(post_params)
        flash[:notice] = "参加者レビュー情報を更新しました。"
        redirect_to users_posts_index_path(current_user)
          #  session[:planner_id]=planner.id
          flash[:notice]="参加者レビュー情報を更新しました。"
      else
        error_messages = [
          "タイトルは最低5文字必要です。",
        "内容は最低10文字必要です。"
        ]
        flash[:alert] = error_messages.join("\n")
        redirect_to users_workshops_edit_path(current_user)
      end
    end  
    # app/controllers/users/posts_controller.rb
  # app/controllers/users/posts_controller.rb
# app/controllers/users/posts_controller.rb
  def destroy
    @post = Post.find_by(id: params[:post_id]) # Make sure to retrieve the correct post

    if @post.present?
      # Remove the image using CarrierWave's provided remove method
      @post.remove_image! if @post.image?

      # Attempt to destroy the post
      if @post.destroy
        flash[:notice] = '投稿を削除しました。'
      else
        flash[:alert] = '投稿の削除に失敗しました。'
      end
    else
      flash[:alert] = '投稿を削除しました'
    end

    
    redirect_to users_workshops_show_path(user_id: params[:user_id], workshop_id: params[:workshop_id])
  end

 
  
  
    private
    def post_params
      # Strong parameters – Allows title, content, image, score, and ensures user_id is not tampered with.
      params.require(:post).permit(:title, :content, :image, :workshop_id)
    end
end