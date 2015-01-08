class VideosController < ApplicationController

  def create
    # puts :video[video_params]
    # uploader = VideoUploader.new
    # uploader.store!(params[:video])
    puts "**************************************************************"
    # puts params[:video][@original_filename]
    # puts params[:video][:@original_filename]
    # puts params[:video].original_filename
    puts "**************************************************************"
    Video.create!(video_params)
    redirect_to user_path(session["warden.user.user.key"][0][0])
  end

private

  def video_params
    params.require(:video).permit(:user_id, :tag_id, :title, :content)
  end
end
