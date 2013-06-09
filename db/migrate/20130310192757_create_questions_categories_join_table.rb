class CreateQuestionsCategoriesJoinTable < ActiveRecord::Migration
  def up
    create_table :categories_questions, :id => false do |t|
      t.references :category
      t.references :question
    end
    add_index :categories_questions, [:category_id, :question_id]
    add_index :categories_questions, [:question_id, :category_id]
  end

  def down
  end
end
