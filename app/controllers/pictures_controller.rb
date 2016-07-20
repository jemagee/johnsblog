class PicturesController < ApplicationController

  before_action :check_authorization
  before_action :get_picture, only: [:edit, :show, :update, :destroy]

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
  end

  def edit
  end

  def update
    @picture.update_attributes(picture_params)
    flash[:success] = "The picture was updated"
    redirect_to @picture
  end
  
  private

    def picture_params
      params.require(:picture).permit(:name, :image)
    end

    def get_picture
      @picture = Picture.find(params[:id])
    end
end
