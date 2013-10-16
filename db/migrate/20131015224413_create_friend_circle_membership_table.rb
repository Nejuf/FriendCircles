class CreateFriendCircleMembershipTable < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :user_id, null: false
      t.integer :friend_circle_id, null: false

      t.timestamps
    end
    add_index :friend_circle_memberships, :user_id
    add_index :friend_circle_memberships, :friend_circle_id
    add_index :friend_circle_memberships, [:friend_circle_id, :user_id], unique: true
  end
end
