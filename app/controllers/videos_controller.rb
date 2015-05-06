class VideosController < ApplicationController

  def new
    @video = Video.new(params.permit( :key))
    @tag = Tag.new
    @group = Group.new
  end

  def create
    user_id = session["warden.user.user.key"][0][0]
    params[:video][:user_id] = user_id

    new_video = Video.create(video_params)

    tag_array = Tag.parse_tags(params[:video][:tag][:name])

    tag_array.each do |tag_obj|
        new_video.tags << tag_obj
    end

    #group_array = Group.parse_groups(params[:video][:group], user_id)

    redirect_to user_path(user_id), :notice => "Your video has been created"
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

  def tag_params
    params.require(:video).permit(:user_id, :tag_id, :title, :video_url, :key)
  end
end
