class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :user_id
      t.references :tag_id
      t.string     :title
      t.string     :video_url

      t.timestamps
    end
  end
end
