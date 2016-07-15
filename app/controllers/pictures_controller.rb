class PicturesController < ApplicationController

  before_action :check_authorization

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
    flash[:success] = "The picture was uploaded"
    redirect_to @picture
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

    def picture_params
      params.require(:picture).permit(:name, :image)
    end
end
