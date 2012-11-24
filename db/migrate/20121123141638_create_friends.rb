class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.integer :degree
      t.datetime :last_seend

      t.timestamps
    end
  end
end
