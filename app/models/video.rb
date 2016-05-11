require 'cgi'

class Video < ActiveRecord::Base
  mount_uploader :video_url, VideoUploader
  after_create  :create_rating

  has_and_belongs_to_many :tags, :join_table => "videos_tags"
  has_and_belongs_to_many :groups, :join_table => "videos_groups"
  belongs_to :user
  has_many :comments
  has_many :ratings

  accepts_nested_attributes_for :tags, :groups

  def create_rating
    Rating.create(user_id: self.user_id, video_id: self.id, score: 3)
  end

  def user_collection
    self.user.videos.sample(6)
  end

  def self.top_rated
    Rating.popular_ratings.sample(7).map {|r| r.video}
  end

  def avg_score
    scores = self.ratings

    total = scores.map{|s| s.score}.reduce(:+)

    (total * 10) / scores.length
  end

  def similar_videos
    retrieve_similar(6)
  end

  def sm_set
    retrieve_similar(3)
  end

  def show_thumbnail
    CGI.escape self.video_url.thumb.to_s
  end

  private

  def retrieve_similar(amount)
    self.tags.sample.videos.sample(amount)
  end

end
