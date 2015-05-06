class CommentsController < ApplicationController

  def create
    if user_signed_in?
      user_id = session["warden.user.user.key"][0][0]
      params[:comment][:sender_id] = user_id
      Comment.create(comment_params)

      redirect_to user_path(user_id), :notice => "Your comment has been sent"
    else
      redirect_to new_user_registration_path, :alert => "You must be logged in to do that"
    end
  end

private

  def comment_params
    params.require(:comment).permit(:video_id, :user_id, :body)
  end
end
