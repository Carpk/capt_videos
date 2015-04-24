class VideosController < ApplicationController

  def new
    # {"bucket"=>"captainvideos",
    #  "key"=>"uploads/video/video_url//b7ba6f28-bf37-459e-86f7-02d45c104b1a/Twisted Jukebox - Angels Will Rise.mp4",
    #  "etag"=>"\"e5728b0c0973a70cc7f917aca0286e6e\""}

    @video = Video.new(params.permit( :key))
    @tag = Tag.new
  end

  def create
    user_id = session["warden.user.user.key"][0][0]
    params[:video][:user_id] = user_id

    Video.create!(video_params)

    redirect_to user_path(user_id)
  end

  def edit

  end

  def show
    @video = Video.find_by_id(params[:id])
  end

private

  def video_params
    params.require(:video).permit(:user_id, :tag_id, :title, :video_url, :key)
  end
end
