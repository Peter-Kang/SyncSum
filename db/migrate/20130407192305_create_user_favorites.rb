class CreateUserFavorites < ActiveRecord::Migration
  def up
    create_table "user_favorites", :force => true do |t|
      t.integer  "employer_id"
      t.integer  "candidate_id"
      t.datetime "created_at",   :null => false
      t.datetime "updated_at",   :null => false
    end
  end

  def down
    drop_table :user_favorites
  end
end
