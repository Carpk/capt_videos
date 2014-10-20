class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    # if @user.save
    #   sign_in @user
    #   redirect_to user_path(@user.id)
    # else
      render "new"
    # end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
