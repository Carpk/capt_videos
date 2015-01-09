class VideosController < ApplicationController

  def create
    user_id = session["warden.user.user.key"][0][0]
    params[:video][:user_id] = user_id
    video = Video.new(video_params)
    video.save
    redirect_to user_path(user_id)
  end

private

  def video_params
    params.require(:video).permit(:user_id, :tag_id, :title, :content)
  end
end
