class CreateBusinessSectorsExperiencesTable < ActiveRecord::Migration
  def up
    create_table :business_sectors_experiences, id: false do |t|
      t.references :business_sector
      t.references :experience
    end

    add_index :business_sectors_experiences, [:business_sector_id, :experience_id], name: 'bus_sector_experience_join'
  end

  def down
    remove_index :business_sectors_experiences, name: 'bus_sector_experience_join'

    drop_table :business_sectors_experiences
  end
end
