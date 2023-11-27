class Planners::WorkshopsController < ApplicationController
  include  PlannerSessionsHelper
  def index
    @workshops = Workshop.all
    @posts=Post.all
    @stras=Star.all
    
  end
  def new
    @workshop = Workshop.new
  end
  def create
      #p "params: #{params}"#
      @planner=Planner.find_by(id: params[:planner_id])
      @workshop = @planner.workshops.build(workshop_params)
      

      if @workshop.save
        redirect_to planners_workshops_index_path
      else
        #p"========"
        #p @workshop.errors.full_messages
        #p"==========="
        render "new"
      end
  end
  def show #詳細
    @workshop = Workshop.find_by(id:params[:workshop_id])
    #p"========"
    #p @workshop.errors.full_messages
    #p"==========="
   
    @post=@workshop.posts
    @stra=Star.new
  end
  def edit #詳細
    p "==========edit start========="
    p params
    p @workshop
    p"==================="
    @workshop = Workshop.find_by(id:params[:workshop_id])
    p "==================="
    p params
    p @workshop
    p"==================="
  end
  def update
    p "==================="
    p params
    p @workshop
    p"==================="
       @workshop=Workshop.find_by(id:params[:workshop_id]) #値を取得する
    if @workshop.update(workshop_params)  #workshop_paramsの内容を上書きする。
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to planners_workshops_show_path(@workshop.id),data: {"turbolinks" => false}
    else
      render :edit
    end
    p "==================="
    p params
    p @workshop
    p"==================="
  end
  def destroy
    @workshop=Workshop.find_by(id:params[:workshop_id])
    @workshop.destroy
    redirect_to  planners_workshops_index_path
  end


  private
  def workshop_params
    params.require(:workshop).permit(:w_title,:w_theme,:image,:prefecture,:address1,:address2,:planner_id,:post_id,:w_detail,:start_time,:end_time,:start_date,:end_date,:personnel,:precautions)
  end 
end

