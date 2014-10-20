class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :video
      t.text       :body

      t.timestamps
    end
  end
end
