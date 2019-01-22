class WelcomeController < ApplicationController
  def index
  end

  def home
    @user = User.find_by(id: params[:user_id])
  end
end
