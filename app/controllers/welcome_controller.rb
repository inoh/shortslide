class WelcomeController < ApplicationController
  skip_filter :authenticate_user!

  def index
    if user_signed_in?
      redirect_to slides_url
    else
      @slides = Slide.all
    end
  end
end
