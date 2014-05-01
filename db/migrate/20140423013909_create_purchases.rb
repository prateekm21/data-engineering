class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :file_name
      t.decimal :gross_revenue, :scale => 2
      t.timestamps
    end
  end
end
