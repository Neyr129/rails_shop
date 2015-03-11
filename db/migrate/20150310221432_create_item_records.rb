class CreateItemRecords < ActiveRecord::Migration
  def change
    create_table :item_records do |t|
      t.integer :history_id
      t.string :name
      t.integer :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
