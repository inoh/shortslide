class PagesController < ApplicationController
  before_action :set_slide
  before_action :set_page, only: [:show, :edit, :update, :destroy]

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

  # GET /slides/1/pages/1/edit
  def edit
  end

  # PATCH/PUT /slides/1/pages/1
  # PATCH/PUT /slides/1/pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to slide_pages_url(@slide), notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1/pages/1
  # DELETE /slides/1/pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to slide_pages_url(@slide) }
      format.json { head :no_content }
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
