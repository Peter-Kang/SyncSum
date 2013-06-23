class CreateJobTitles < ActiveRecord::Migration
  def up
    create_table "job_titles", :force => true do |t|
      t.string   "name"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end

  def down
    drop_table :job_titles
  end
end
