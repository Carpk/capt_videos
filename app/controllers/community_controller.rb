class CommunityController < ApplicationController

  def index
    @all_users = User.all
  end

  def show
    @user_profile = User.find_by_username(params[:id])
  end
end
