class CreatePositions < ActiveRecord::Migration
  def up
    create_table "positions", :force => true do |t|
      t.string   "title"
      t.text     "description"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
      t.integer  "employer_id"
      t.integer  "minDegree"
      t.integer  "maxDegree"
      t.integer  "minExp"
      t.integer  "maxExp"
      t.integer  "duration"
    end
  end

  def down
    drop_table :positions
  end
end
