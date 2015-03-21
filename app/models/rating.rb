class Rating < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  def self.avg_score(id)
    scores = Rating.where(video_id: id)
    total = 0
    scores.each do |score_card|
      total += score_card.score
    end
    (total * 10) / scores.length
  end
end
