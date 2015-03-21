class Video < ActiveRecord::Base
  mount_uploader :content, VideoUploader

  belongs_to :user
  belongs_to :tag
  has_many :ratings

  def self.collection_sample(user_id)
    sample_set = []
    user_videos = User.find_by_id(user_id).videos
    6.times do
      sample_set << user_videos.sample
    end
    sample_set
  end


end
