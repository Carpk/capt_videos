class Tag < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :video
  has_and_belongs_to_many :videos, :join_table => "videos_tags"

  def sample_set
    Tag.where(tag: self.name).sample(6).map {|t| t.video}
  end

  def self.tag_names
    Tag.all.map {|tag| tag.name}.sort
  end

  def self.parse_tags(tags)
    tag_obj = []
    tags_array = tags.split(",")

    tags_array.map!{|word| word.strip.downcase}

    tags_array.each do |tag_word|
      tag_found = Tag.find_by_name(tag_word)
      tag_found ? tag_obj << tag_found : tag_obj << Tag.create({name: tag_word})
    end
    tag_obj
  end

end
