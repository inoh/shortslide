class WelcomeController < ApplicationController
  def index
    @slides = Slide.all
  end
end
