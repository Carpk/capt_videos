class Rating < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  def avg_score

  end
end
