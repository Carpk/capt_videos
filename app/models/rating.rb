class Rating < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  def self.popular_ratings
    Rating.where(score: 4)
  end

end
