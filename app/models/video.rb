class Video < ActiveRecord::Base
  belongs_to :user, :tag
end
