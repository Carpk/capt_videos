class CreateVideosGroups < ActiveRecord::Migration
  def change
    create_table :videos_groups do |t|
      t.references :video
      t.references :group
    end
  end
end
