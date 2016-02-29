class Tag < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :video
  has_and_belongs_to_many :videos, :join_table => "videos_tags"

  def self.parse_tags(tags)
    tags.split(",").map do |word|
      tag_word = word.strip.downcase
      found_tag = Tag.find_by_name(tag_word)
      found_tag ? found_tag : Tag.create({name: tag_word})
    end
  end
end
