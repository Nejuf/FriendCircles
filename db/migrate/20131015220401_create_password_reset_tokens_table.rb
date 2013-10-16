class CreatePasswordResetTokensTable < ActiveRecord::Migration
  def change
    create_table :reset_tokens do |t|
      t.integer :user_id, :null => false
      t.string :reset_token, :null => false

      t.timestamps
    end
    add_index :reset_tokens, :reset_token, :unique => true
    add_index :reset_tokens, :user_id, :unique => true
  end
end
