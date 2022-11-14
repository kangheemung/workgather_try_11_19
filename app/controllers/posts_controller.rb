class PostsController < ApplicationController
  include  UserSessionsHelper
    def index
      @posts=Post.all
      @workshops=Workshop.all
    end
    def new
      @post=Post.new
      @workshops=Workshop.all
    end
    def create
       #p "params: #{params}"
       @post = current_user.posts.build(post_params)
       if @post.save
         redirect_to posts_index_path
       else
         render :new
       end
    end
    def show
      @post=Post.find_by(id: params[:id])
      @workshop =Workshop.find_by(id: params[:id])
    end
    def edit
      @post=Post.find_by(id: params[:id])
     
    end
    def update
      @post=Post.find_by(id: params[:id])
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
      params.require(:post).permit(:title,:content,:image)
    end 
end