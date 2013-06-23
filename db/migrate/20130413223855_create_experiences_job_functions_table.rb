class CreateExperiencesJobFunctionsTable < ActiveRecord::Migration
  def up
    create_table :experiences_job_functions, id: false do |t|
      t.references :experience
      t.references :job_function
    end

    add_index :experiences_job_functions, [:experience_id, :job_function_id], name: 'exp_job_function_join'
  end

  def down
    remove_index :experiences_job_functions, name: 'exp_job_function_join'

    drop_table :experiences_job_functions
  end
end
