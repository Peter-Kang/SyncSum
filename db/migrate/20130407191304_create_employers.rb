class CreateEmployers < ActiveRecord::Migration
  def up
    create_table "employers", :force => true do |t|
      t.string   "name"
      t.string   "tagline"
      t.boolean  "paid"
      t.integer  "user_id"
      t.datetime "created_at",             :null => false
      t.datetime "updated_at",             :null => false
      t.integer  "max_degree_id"
      t.integer  "min_degree_id"
      t.string   "company_size"
      t.string   "search_radius"
      t.text     "description"
      t.string   "type"
      t.string   "website"
      t.string   "primary_industry"
      t.integer  "size"
      t.integer  "employee_turnover"
      t.string   "corporate_headquarters"
      t.integer  "international_offices"
      t.string   "mission_statement"
    end
  end

  def down
    drop_table :employers
  end
end
