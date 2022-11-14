class PostsController < ApplicationController
  include  UserSessionsHelper
    def index
      @posts=Post.all
      @workshops=Workshop.all
    end
    def new
      @post=Post.new
      @workshop=Workshop.new
    end
    def create
       #p "params: #{params}"
       @post = current_user.posts.build(post_params)
       if @post.save
         redirect_to ("/posts/index")
       else
         render "new"
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
    end
    private
    def post_params
      params.require(:post).permit(:title,:content,:image)
    end 
end