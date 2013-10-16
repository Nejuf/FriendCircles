class CreateFriendshipCircleTable < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :friend_circles, :name
  end
end
