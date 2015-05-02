class Group < ActiveRecord::Base

  has_and_belongs_to_many :videos, :join_table => "videos_groups"

  def self.group_names
    groups = Group.all
    group_names = []
    groups.each do |group|
      group_names << group.name
    end
    group_names.sort
  end
end
