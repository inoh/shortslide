class PagesController < ApplicationController
  before_action :set_slide

  # GET /slides/1/pages
  def index
    @pages = @slide.pages
  end

  # PATCH/PUT /slides/1/pages/1
  # PATCH/PUT /slides/1/pages/1.json
  def update
    respond_to do |format|
      if @slide.update(page_params)
        format.html { redirect_to slide_pages_url(@slide) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_slide
      @slide = Slide.find(params[:slide_id])
    end

    def page_params
      params.require(:slide).permit(:content)
    end
end
