class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authentication

  helper_method :current_user

  private
    def authentication
      unless current_user
        redirect_to sessions_url
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
