class CreateEmployersInstitutionTypesTable < ActiveRecord::Migration
  def up
    create_table :employers_institution_types, :id => false do |t|
      t.references :employer
      t.references :institution_type
    end

    add_index :employers_institution_types, :employer_id, :name => "employer_id_on_institution_type_join"
    add_index :employers_institution_types, :institution_type_id, :name => "institution_type_id_on_employer_join"
  end

  def down
    remove_index :employers_institution_types, :name => "institution_type_id_on_employer_join"
    remove_index :employers_institution_types, :name => "employer_id_on_institution_type_join"
    drop_table :employers_institution_types
  end
end
