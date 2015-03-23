class WelcomeController < ApplicationController

  def index
    @pop_videos = Video.find(:all, :order => "id desc", :limit => 6)
    @recently_uploaded = Video.find(:all, :order => "id desc", :limit => 6)
  end

end
