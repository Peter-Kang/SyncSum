class CreateCandidates < ActiveRecord::Migration
  def up
    create_table "candidates", :force => true do |t|
      t.string   "resume"
      t.string   "first_name"
      t.string   "last_name"
      t.datetime "created_at",              :null => false
      t.datetime "updated_at",              :null => false
      t.date     "dob"
      t.integer  "user_id"
      t.string   "employment_status"
      t.string   "search_radius"
      t.string   "min_company_search_size"
      t.string   "max_company_search_size"
      t.string   "resume_file_name"
      t.string   "resume_content_type"
      t.integer  "resume_file_size"
      t.datetime "resume_updated_at"
    end
  end

  def down
    drop_table :candidates
  end
end
