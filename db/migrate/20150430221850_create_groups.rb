class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :user
      t.boolean    :private, :default => false
      t.string     :name
      t.text       :description

      t.timestamps
    end
  end
end
