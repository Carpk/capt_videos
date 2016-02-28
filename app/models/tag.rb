class Tag < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :video
  has_and_belongs_to_many :videos, :join_table => "videos_tags"

  def sample_set
    tagged_samples = []
    matching_tags = Tag.where(tag: self.name)
    6.times { tagged_samples << matching_tags.sample.video }
    tagged_samples
  end

  def self.tag_names
    Tag.all.map {|tag| tag.name}.sort
  end

  def self.parse_tags(tags)
    tag_obj = []
    tag_array = tags.split(",")

    tag_array.map!{|word| word.strip.downcase}

    tag_array.each do |tag_word|
      tag_found = Tag.find_by_name(tag_word)
      tag_found ? tag_obj << tag_found : tag_obj << Tag.create({name: tag_word})
    end
    tag_obj
  end

end
