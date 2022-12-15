class Users::WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.all
    @workshop=Workshop.new
    @posts=Post.all
  end

  def show
    @workshops=Workshop.all
    @workshop = Workshop.find(params[:id])
    #p"========"
    #p @workshop.errors.full_messages
    #p"==========="
    @post = Post.new
    @posts=Post.all
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def new
  end
end
