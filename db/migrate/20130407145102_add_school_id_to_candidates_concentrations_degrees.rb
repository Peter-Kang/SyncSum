class AddSchoolIdToCandidatesConcentrationsDegrees < ActiveRecord::Migration
  def change
    add_column :educations, :school_id, :integer
    add_index :educations, :school_id
  end
end
