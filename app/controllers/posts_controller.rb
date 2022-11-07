class PostsController < ApplicationController
    def index
      @posts=Post.all
      @workshops=Workshop.all
    end
    def new
      @post=Post.new
    end
    def create
       #p "params: #{params}"
       #@post = current_user.posts.build(post_params)
       @post = Post.new(post_params)
       @post.user_id= current_user.id
       if @post.save
         redirect_to ("/posts/index")
       else
         render "new"
       end
    end
    def show
    end
    private
    def post_params
      params.require(:post).permit(:title,:content,:image)
    end 
end