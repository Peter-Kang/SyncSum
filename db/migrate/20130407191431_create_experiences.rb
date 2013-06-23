class CreateExperiences < ActiveRecord::Migration
  def up
    create_table "experiences", :force => true do |t|
      t.string   "company"
      t.string   "title"
      t.string   "responsibilities"
      t.date     "start"
      t.date     "end"
      t.datetime "created_at",       :null => false
      t.datetime "updated_at",       :null => false
      t.integer  "candidate_id"
    end
  end

  def down
    drop_table :experiences
  end
end
