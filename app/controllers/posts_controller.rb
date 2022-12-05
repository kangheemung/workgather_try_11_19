class PostsController < ApplicationController
  include  UserSessionsHelper
    def index #workshopのレビュー一覧
      @workshop =Workshop.new
      @posts=Post.all
    end
    def new
      @post=Post.new
      @workshop =Workshop.new
    end
    def create
       post = current_user.posts.build(post_params)
       if post.save 
        redirect_to workshops_review_path(post.workshop_id)
       else
         render :review
       end
    end
    def show
     @workshop =Workshop.find(params[:id])
     @post=Post.new
    end
    def edit
      @post=Post.find_by(params[:id])
    end
    def update
      @post=Post.find_by(params[:id])
      if @post.update(post_params)
          #  session[:planner_id]=planner.id
          flash[:notice]="参加者レビュー情報を更新しました。"
          redirect_to posts_index_path(@post.id)
      else
        render :edit
      end
    end
    private
    def post_params
      params.require(:post).permit(:title,:content,:image,:workshop_id,:score )
    end 
end