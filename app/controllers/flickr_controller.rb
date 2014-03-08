class FlickrController < ApplicationController
  def index
    @flickrs = current_user.flickrs

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @flickrs }
    end
  end
end
