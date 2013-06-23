class AddImportanceToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :importance_level, :string
  end
end
