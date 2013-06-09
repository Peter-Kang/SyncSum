class CreateCandidateApps < ActiveRecord::Migration
  def change
    create_table :candidate_apps do |t|
      t.integer :candidate_id
      t.integer :position_id

      t.timestamps
    end
  end
end
