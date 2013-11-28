# coding: utf-8

class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :share, :edit, :update, :destroy]
  skip_filter :authentication, :only => [:show, :share]

  # GET /slides
  def index
    @slides = Slide.all
  end

  # GET /slides/1
  def show
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
        format.html { redirect_to slide_pages_url(@slide) }
        format.json { render action: 'show', status: :created, location: @slide }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /slides/1/edit
  def edit
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to slide_pages_url(@slide), notice: 'Slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url }
      format.json { head :no_content }
    end
  end

  private
    def set_slide
      @slide = Slide.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:title, :content)
    end

end
