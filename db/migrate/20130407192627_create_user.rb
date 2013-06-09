class CreateUser < ActiveRecord::Migration
  def up
    create_table :users, :force => true do |t|
      t.string   "phone"
      t.string   "password"
      t.date     "registrationDate"
      t.string   "street"
      t.string   "apt"
      t.string   "city"
      t.string   "state"
      t.string   "zip"
      t.string   "country"
      t.datetime "created_at",                             :null => false
      t.datetime "updated_at",                             :null => false
      t.string   "email",                  :default => "", :null => false
      t.string   "encrypted_password",     :default => "", :null => false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          :default => 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.string   "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string   "website"
      t.float    "latitude"
      t.float    "longitude"
      t.string   "avatar_file_name"
      t.string   "avatar_content_type"
      t.integer  "avatar_file_size"
      t.datetime "avatar_updated_at"
    end
    add_index :users, ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
    add_index :users, ["email"], :name => "index_users_on_email", :unique => true
    add_index :users, ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  def down
  end
end
