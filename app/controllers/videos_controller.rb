class VideosController < ApplicationController

  def new
    @video = Video.new(params.permit( :key))
    @tag = Tag.new
    @group = Group.new
  end

  def create
    # Parameters: {"utf8"=>"✓", "authenticity_token"=>"ZvlYhkiYVryXG6kf6jdNtcSqZ1Y5QXwBa3C68QbnVoU=", "video"=>{"title"=>"new title", "key"=>"uploads/video/video_url/62e7c560-9f43-4fa3-9930-b8467ebc6770/Sonic Librarian - Firefly Mist.mp4", "tag"=>{"name"=>"food, money"}}, "commit"=>"Create Video"}
    user_id = session["warden.user.user.key"][0][0]
    params[:video][:user_id] = user_id

    video = Video.create(video_params)

    tag_array = Tag.parse_tags(params[:video][:tag][:name])

    tag_array.each do |tag|
      Tag.create(tag.strip)
    end

    #create groups
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

  def tag_params
    params.require(:video).permit(:user_id, :tag_id, :title, :video_url, :key)
  end
end
