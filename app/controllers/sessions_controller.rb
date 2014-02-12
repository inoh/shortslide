class SessionsController < ApplicationController
  skip_filter :authentication

  def new
    @user = User.new

    render 'login'
  end

  def create
    @user = User.new(params.require(:session).permit(:email, :password))

    render 'login'
  end

  def auth_callback
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to slides_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
