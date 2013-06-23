class CreateBusinessSectorsPositionsJoinTable < ActiveRecord::Migration
  def up
    create_table "business_sectors_positions", :id => false, :force => true do |t|
      t.integer  "position_id"
      t.integer  "business_sector_id"
    end
    add_index :business_sectors_positions, [:business_sector_id]
    add_index :business_sectors_positions, [:position_id]
  end

  def down
    drop_table :business_sectors_positions
  end
end
