class Tag < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :video
  has_and_belongs_to_many :videos, :join_table => "videos_tags"

  def self.parse_tags(tags)
    tags_array = tags.split(",")

    tags_array.map!{|word| word.strip.downcase}

    tags_array.map! do |tag_word|
      found_tag = Tag.find_by_name(tag_word)
      found_tag ? found_tag : Tag.create({name: tag_word})
    end
    tags_array
  end

end
