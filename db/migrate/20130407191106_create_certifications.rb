class CreateCertifications < ActiveRecord::Migration
  def up
    create_table "certifications", :force => true do |t|
      t.string   "title"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end

  def down
    drop_table :certifications
  end
end
