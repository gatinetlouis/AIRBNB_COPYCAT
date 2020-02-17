class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.boolean :from_user_to_car
      t.string :title
      t.text :message
      t.integer :rating
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
