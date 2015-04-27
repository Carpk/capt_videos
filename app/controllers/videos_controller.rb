class VideosController < ApplicationController

  def new
    @video = Video.new(params.permit( :key))
    @tag = Tag.new
  end

  def create
    user_id = session["warden.user.user.key"][0][0]
    params[:video][:user_id] = user_id

    Video.create!(video_params)
    #create tags
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
