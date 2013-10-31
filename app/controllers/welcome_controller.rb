class WelcomeController < ApplicationController
  skip_filter :authentication

  def index
    @slides = Slide.all
  end
end
