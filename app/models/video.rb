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
    videos = []
    top_rated = Rating.popular_ratings
    7.times do
      videos << top_rated.sample.video
    end
    videos
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
    retrieve_similar(6)
  end

  def sm_set
    retrieve_similar(3)
  end

  private

  def retrieve_similar(amount)
    all_tags = self.tags
    sample_set = []

    amount.times do
      sample_set << all_tags.sample.videos.sample
    end

    sample_set
  end

end
