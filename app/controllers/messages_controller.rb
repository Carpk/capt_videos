class MessagesController < ApplicationController

  def create
    if user_signed_in?
      user_id = session["warden.user.user.key"][0][0]
      params[:message][:sender_id] = user_id
      Message.create(message_params)

      redirect_to user_path(user_id)
    else
      redirect_to new_user_registration_path, :notice => "You must be logged in to do that"
    end
  end

private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :body)
  end
end
