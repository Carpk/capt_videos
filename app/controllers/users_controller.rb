class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @user = User.find_by_id(session["warden.user.user.key"][0][0])
    # if @user.save
    #   sign_in @user
    #   redirect_to user_path(@user.id)
    # else
    #   render "new"
    # end
  end

  def show
    @user = User.find_by_id(session["warden.user.user.key"][0][0])
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :birthdate, :password, :password_confirmation)
  end
end
