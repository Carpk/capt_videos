class Tag < ActiveRecord::Base
  belongs_to :video
  has_and_belongs_to_many :videos, :join_table => "videos_tags"

  def sample_set
    tagged_samples = []
    matching_tags = Tag.where(tag: self.name)
    6.times do
      tagged_samples << matching_tags.sample.video
    end
    tagged_samples
  end

  def self.tag_names
    tags = Tag.all
    tag_names = []
    tags.each do |tag|
      tag_names << tag.name
    end
    tag_names.sort
  end

end
