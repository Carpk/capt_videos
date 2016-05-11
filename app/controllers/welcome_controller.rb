class WelcomeController < ApplicationController

  def index
    @rated_videos = Video.top_rated
    @vid_of_day = @rated_videos.pop
    @recently_uploaded = Video.last(6).reverse
  end

end
