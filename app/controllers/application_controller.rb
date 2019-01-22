class ApplicationController < ActionController::Base
  include WelcomeHelper

  private

  def correct_user
    @user = User.find_by(id: params[:user_id])
    redirect_to(posts_path) unless current_user?(@user)
  end
end
