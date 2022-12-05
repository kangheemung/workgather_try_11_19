class WorkshopsController < ApplicationController
  include  PlannerSessionsHelper
  def index
    @workshops = Workshop.all
    @workshop=Workshop.new
    @posts=Post.all
  end
  def new
    @workshop = Workshop.new
    @planner = Planner.new
  end
  def create
     #p "params: #{params}"#
     @workshop = current_planner.workshops.build(workshop_params)
     if @workshop.save
       redirect_to ("/workshops/index")
     else
       #p"========"
       #p @workshop.errors.full_messages
       #p"==========="
       render "new"
     end
  end
  def show #詳細
    @workshop = Workshop.find(params[:id])
    @post = Post.new
    @posts=Post.all
  end
  def review #レビュー作成
    @workshop = Workshop.find(params[:id])
    @post = Post.new
    @posts=Post.all
  end
  def edit #詳細
    
  end
  def update
    @workshop=workshop.find(params[:id])
    if @workshop.update(workshop_params)
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to workshops_show_path(@workshop.id)
    else
      render :edit
    end

  end
  
  private
  def workshop_params
    params.require(:workshop).permit(:w_title,:w_theme,:image,:prefecture,:address1,:address2,:planner_id,:post_id,:w_detail,:time,:personnel,:precautions)
  end 
end
