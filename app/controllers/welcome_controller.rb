class WelcomeController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      redirect_to new_user_path
    else
      render 'index'
    end
  end
end
