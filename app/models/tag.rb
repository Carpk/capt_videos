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

  def self.tag_names
    tags = Tag.all
    categories = []
    tags.each do |tag|
      categories << tag.tag
    end
    categories.uniq
  end

end
