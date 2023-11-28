class Users::WorkshopsController < ApplicationController
  include  UserSessionsHelper
    def index
      @workshops = Workshop.all
     "=======check================"
     p params
     "========================="
    end  
    def new
      
      @post=Post.new
      @workshop =Workshop.find_by(id: params[:workshop_id])
      "=======check================"
      p params
      "========================="
      
    end
    def show
     @reservation=Reservation.find_by(id: params[:r_id])
     @workshop =Workshop.find_by(id: params[:workshop_id])
     @user =User.find_by(id:params[:user_id])
     @post=Post.new
     @posts=@workshop.posts
    end
    def edit
    @workshop =Workshop.find_by(id: params[:workshop_id])
    @post=Post.find(params[:post_id])
    end
    
    
   
  end
