class CreateChatroomUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chatroom_users do |t|
      t.references :Chatroom, foreign_key: true
      t.string :username

      t.timestamps
    end
  end
end
