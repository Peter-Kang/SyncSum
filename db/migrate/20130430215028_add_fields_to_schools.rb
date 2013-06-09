class AddFieldsToSchools < ActiveRecord::Migration
  def change
  	add_column :schools, :state, :string
  	add_column :schools, :city, :string
  end
end
