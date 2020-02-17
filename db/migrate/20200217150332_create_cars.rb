class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :color
      t.integer :price_per_day
      t.text :description
      t.string :pick_up_address
      t.string :fuel_type
      t.boolean :automatic
      t.boolean :neon
      t.integer :watts
      t.integer :rim_size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
