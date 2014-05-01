class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.string :purchaser_name
      t.string :item_description
      t.decimal :item_price, :precision => 8, :scale => 2
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name
      t.integer :purchase_id
      t.timestamps
    end
  end

  def self.down
    drop_table :inventories
  end
end
