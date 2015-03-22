class Video < ActiveRecord::Base
  mount_uploader :content, VideoUploader

  belongs_to :user
  belongs_to :tag
  has_many :ratings

  def collection_samples
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

end
