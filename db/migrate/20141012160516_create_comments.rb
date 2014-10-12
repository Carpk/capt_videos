class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user_id
      t.references :video_id
      t.text       :body

      t.timestamps
    end
  end
end
