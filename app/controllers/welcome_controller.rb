class WelcomeController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render 'index'
    end
  end

  def create_with_omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    log_in user
    redirect_to user
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
