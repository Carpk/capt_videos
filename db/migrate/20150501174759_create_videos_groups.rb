class VideosGroups < ActiveRecord::Migration
  def change
    t.references :video
    t.references :group
  end
end
