class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :importance_id
      t.integer :employer_id
      t.integer :correct_answer_id
      t.integer :category_id

      t.timestamps
    end
  end
end
