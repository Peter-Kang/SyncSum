class CreateJobFunctionsTable < ActiveRecord::Migration
  def up
    create_table :job_functions do |t|
      t.integer :experience_id
      t.integer :position_id
    end

    add_index :job_functions, [:experience_id, :position_id]
  end

  def down
    remove_index :job_functions, :experience_id
    remove_index :job_functions, :position_id

    drop_table :job_functions
  end
end
