# coding: utf-8
class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :destroy]

  # GET /images
  def index
    @image = Image.new
    @images = Image.all

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @images }
    end
  end

  def create
    @image = Image.create(image_params)

    redirect_to images_url
  end

  def destroy
    @image.destroy

    redirect_to images_url
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:file)
    end

end
