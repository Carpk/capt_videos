class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:name])
    redirect_to root_path
  end

  def destroy

    redirect_to root_path
  end
end
