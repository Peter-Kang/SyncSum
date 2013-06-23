class CreateCandidatesCertificationsJoinTable < ActiveRecord::Migration
  def up
    create_table "candidates_certifications", :id => false, :force => true do |t|
      t.integer  "certification_id"
      t.integer  "candidate_id"
    end
    add_index :candidates_certifications, [:candidate_id]
    add_index :candidates_certifications, [:certification_id]
  end

  def down
    drop_table :candidates_certifications
  end
end
