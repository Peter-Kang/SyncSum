class CreateUserBlocks < ActiveRecord::Migration
  def change
    create_table :user_blocks do |t|
      t.integer :blocker
      t.integer :blockee

      t.timestamps
    end
  end
end
