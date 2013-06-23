class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :candidate_id
      t.integer :concentration_id
      t.integer :degree_id
      t.timestamps
    end
  end
end
