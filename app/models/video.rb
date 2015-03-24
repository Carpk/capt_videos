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
    user_videos = Video.where(user_id: self.user_id)
    6.times do
      sample_set << user_videos.sample
    end
    sample_set
  end

  def avg_score
    scores = Rating.where(video_id: self.id)
    total = 0
    scores.each do |score_card|
      total += score_card.score
    end
    (total * 10) / scores.length
  end

  def matching_tag
    tags = Tag.where(video_id: self.id)
    tagged_samples = []
    tags.each do |tagged|
      matching_videos = Tag.where(tag: tagged.tag)
      6.times do
        tagged_samples << matching_videos.sample.video
      end
    end
    tagged_samples
  end

end
