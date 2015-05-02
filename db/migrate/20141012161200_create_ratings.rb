class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :video
      t.integer  :score

      t.timestamps
    end
  end
end
