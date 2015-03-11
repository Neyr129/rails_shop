class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :comment, index: true
      t.references :user, index: true
      t.integer :score

      t.timestamps null: false
    end
    add_foreign_key :ratings, :comments
    add_foreign_key :ratings, :users
  end
end
