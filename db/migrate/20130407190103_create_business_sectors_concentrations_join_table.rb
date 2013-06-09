class CreateBusinessSectorsConcentrationsJoinTable < ActiveRecord::Migration
  def up
    create_table "business_sectors_concentrations", :id => false, :force => true do |t|
      t.integer "concentration_id"
      t.integer "business_sector_id"
    end
    add_index :business_sectors_concentrations, [:business_sector_id]
    add_index :business_sectors_concentrations, [:concentration_id]
  end

  def down
    drop_table :business_sectors_concentrations
  end
end
