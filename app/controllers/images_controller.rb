class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  def create
    p "==============="
    p "params: #{params}"
    p "==============="
    @image=Image.new(image_params)
    @image.user_id= 1
    if @image.save
      redirect_to "/images/index"
    else
      render "new"
    end
  end
  def new
    @image= Image.new
  end
  private
    def image_params
      params.require(:image).permit(:name)
    end
end
