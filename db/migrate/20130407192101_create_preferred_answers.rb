class CreatePreferredAnswers < ActiveRecord::Migration
  def up
    create_table "preferred_answers", :force => true do |t|
      t.integer  "answer_id"
      t.integer  "employer_id"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
    end
  end

  def down
    drop_table :preferred_answers
  end
end
