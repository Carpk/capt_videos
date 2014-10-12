class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.reference :user_id
      t.text      :note

      t.timestamps
    end
  end
end
