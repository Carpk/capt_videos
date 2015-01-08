class Video < ActiveRecord::Base
  mount_uploader :content, VideoUploader

  belongs_to :user
  belongs_to :tag
end
