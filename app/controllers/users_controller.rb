class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    redirect_to root_path
  end

  def show
    @user = User.find_by_id(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
