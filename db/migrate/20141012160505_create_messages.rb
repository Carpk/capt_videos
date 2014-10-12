class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.reference :user_id
      t.text      :messages

      t.timestamps
    end
  end
end
