class CommunityController < ApplicationController

  def index
    @all_users = User.all.order(:username)
  end

  def show
    @user_profile = User.find_by_username(params[:id])
    @message = Message.new(recipient_id: @user_profile.id)
  end
end
