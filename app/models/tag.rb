class Tag < ActiveRecord::Base
  belongs_to :video

  def sample_set
    tagged_samples = []
    matching_tags = Tag.where(tag: self.tag)
    6.times do
      tagged_samples << matching_tags.sample.video
    end
    tagged_samples
  end

end
