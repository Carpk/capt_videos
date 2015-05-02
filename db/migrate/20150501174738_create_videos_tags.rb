class CreateVideosTags < ActiveRecord::Migration
  def change
    create_table :videos_tags do |t|
      t.references :video
      t.references :tag

      t.timestamps
    end
  end
end
