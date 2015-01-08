class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :user
      t.references :tag
      t.string     :title
      t.string     :content

      t.timestamps
    end
  end
end
