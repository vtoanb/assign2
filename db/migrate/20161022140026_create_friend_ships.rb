class CreateFriendShips < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_ships do |t|
      t.integer :friend_id
      t.integer :you_id

      t.timestamps
    end
  end
end
