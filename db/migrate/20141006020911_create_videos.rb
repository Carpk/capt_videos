class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.reference :user_id
      t.reference :tag_id
      t.string    :title
      t.string    :video_url

      t.timestamps
    end
  end
end
