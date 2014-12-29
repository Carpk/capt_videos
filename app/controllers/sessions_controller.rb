class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user
      sign_in user
      redirect_to user_path(user.id)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
