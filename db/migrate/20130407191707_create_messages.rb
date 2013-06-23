class CreateMessages < ActiveRecord::Migration
  def up
    create_table "messages", :force => true do |t|
      t.integer  "recipientID"
      t.integer  "senderID"
      t.string   "content"
      t.boolean  "isRead"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
      t.integer  "groupID"
      t.integer  "chainNumber"
    end
  end

  def down
    drop_table :messages
  end
end
