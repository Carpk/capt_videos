class WelcomeController < ApplicationController

  def index
    @rated_videos = Video.random_video
    @vid_of_day = @rated_videos.pop
    @recently_uploaded = Video.find(:all, :order => "id desc", :limit => 6)
  end

end
