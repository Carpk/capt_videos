class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :video
      t.string    :tag
      t.index     :tag

      t.timestamps
    end
  end
end
