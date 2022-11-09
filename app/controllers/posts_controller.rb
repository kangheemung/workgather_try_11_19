class PostsController < ApplicationController
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
      @workshop =Workshop.find_by(params:id)
    end
    private
    def post_params
      params.require(:post).permit(:title,:content,:image)
    end 
end