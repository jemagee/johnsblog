class PicturesController < ApplicationController

  before_action :check_authorization

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:success] = "The picture was uploaded"
      redirect_to @picture
    else
      flash[:warning] = "The picture was not uploaded"
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

    def picture_params
      params.require(:picture).permit(:name, :image)
    end
end
