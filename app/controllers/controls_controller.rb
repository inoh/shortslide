class ControlsController < ApplicationController
  before_action :set_slide, only: [:show, :create]

  # GET /slides/1/share
  def show
    @control = Control.new(slide_id: @slide.id)
  end

  # POST /slides/1/share
  def create
    @control = Control.new(params[:control].merge(slide_id: @slide.id))
    @control.execute

    redirect_to slide_controls_url(:slide_id => @slide.id)
  end

  private
    def set_slide
      @slide = Slide.find(params[:slide_id])
    end
end
