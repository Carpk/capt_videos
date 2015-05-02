class Video < ActiveRecord::Base
  # mount_uploader :video_url, VideoUploader
  after_create  :create_rating

  has_and_belongs_to_many :tags, :join_table => "videos_tags"
  has_and_belongs_to_many :groups, :join_table => "videos_groups"
  belongs_to :user
  has_many :comments
  has_many :ratings

  accepts_nested_attributes_for :tags

  def create_rating
    Rating.create(user_id: self.user_id,
                  video_id: self.id,
                  score: 3)
  end

  def user_collection
    sample_set = []
    user_videos = self.user.videos
    6.times do
      sample_set << user_videos.sample
    end
    sample_set
  end

  def self.top_rated
    rated_vids = []
    pack = Rating.popular_ratings
    7.times do
      rated_vids << pack.sample.video
    end
    rated_vids
  end

  def avg_score
    scores = self.ratings
    total = 0
    scores.each do |score_card|
      total += score_card.score
    end
    (total * 10) / scores.length
  end

  def similar_videos
    videos = []
    sample_set = []

    6.times do
      sample_set << self.tags.sample.videos.sample
    end

    sample_set
  end

end
