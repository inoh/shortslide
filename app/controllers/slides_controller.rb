# coding: utf-8

class SlidesController < ApplicationController
  before_action :set_slide, only: [:show]

  # GET /slides
  def index
    @slides = Slide.all

    render layout: 'shower'
  end

  # GET /slides/new
  def new
    @slide = Slide.new
  end

  # POST /slides
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to slide_pages_url(@slide), notice: 'slide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @slide }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_slide
      @slide = Slide.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:title)
    end

end
