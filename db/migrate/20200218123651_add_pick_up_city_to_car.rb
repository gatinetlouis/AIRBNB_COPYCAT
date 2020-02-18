class AddPickUpCityToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :pick_up_city, :string
  end
end
