class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :username
      t.string   :password
      t.string   :email
      t.date     :birthdate
      t.boolean  :show_message

      t.timestamps
    end
  end
end
