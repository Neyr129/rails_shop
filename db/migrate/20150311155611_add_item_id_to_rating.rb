class AddItemIdToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :item_id, :integer
  end
end
