class CreateCandidateAnswerJoinTable < ActiveRecord::Migration
  def up
    create_table :answers_candidates, :id => false do |t|
      t.references :answer
      t.references :candidate
    end
    add_index :answers_candidates, [:candidate_id, :answer_id]
    add_index :answers_candidates, [:answer_id, :candidate_id]
  end

  def down
  end
end
