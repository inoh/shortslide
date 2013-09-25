class PagesController < ApplicationController
  before_action :set_slide
  before_action :set_page, only: [:show]

  # GET /slides
  def index
    @pages = @slide.pages
  end

  private
    def set_slide
      @slide = Slide.find(params[:slide_id])
    end

    def set_page
      @page = Page.find(params[:id])
    end
end
