class DropJobFunctionsTable < ActiveRecord::Migration
  def up
    drop_table :job_functions
  end

  def down
    create_table :job_functions do |t|
      t.integer :experience_id
      t.integer :position_id
    end

    add_index :job_functions, [:experience_id, :position_id]
  end
end
