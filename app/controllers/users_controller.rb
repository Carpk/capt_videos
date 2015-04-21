class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @user = User.find_by_id(session["warden.user.user.key"][0][0])
  end

  def show
    @user = User.find_by_id(session["warden.user.user.key"][0][0])
    @uploader = Video.new.video_url
    @uploader.success_action_redirect = new_video_url
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :birthdate, :password, :password_confirmation)
  end
end
