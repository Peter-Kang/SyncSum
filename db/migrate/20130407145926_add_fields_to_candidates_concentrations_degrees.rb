class AddFieldsToCandidatesConcentrationsDegrees < ActiveRecord::Migration
  def change
    add_column :educations, :gpa, :string
    add_column :educations, :honors, :boolean
    add_column :educations, :ranking, :string
  end
end
