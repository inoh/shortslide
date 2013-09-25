class PagesController < ApplicationController
  before_action :set_slide
  before_action :set_page, only: [:show]

  # GET /slides
  def index
    @pages = @slide.pages
  end

  # GET /slides/1/pages/new
  def new
    @page = Page.new
  end

  # POST /slides/1/pages
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to slide_pages_url(@slide), notice: 'page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_slide
      @slide = Slide.find(params[:slide_id])
    end

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      {slide_id: params[:slide_id]}.merge params.require(:page).permit(:content)
    end
end
