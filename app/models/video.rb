class Video < ActiveRecord::Base
  mount_uploader :content, VideoUploader
  after_create  :create_rating

  belongs_to :user
  belongs_to :tag
  has_many :comments
  has_many :ratings
  has_many :tags

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

  def avg_score
    scores = self.ratings
    total = 0
    scores.each do |score_card|
      total += score_card.score
    end
    (total * 10) / scores.length
  end

  def matching_tag
    tags = self.tags
    tagged_samples = []
    tags.each do |tagged|
      tagged_samples << tagged.sample_set
    end
    tagged_samples.flatten
  end

end
