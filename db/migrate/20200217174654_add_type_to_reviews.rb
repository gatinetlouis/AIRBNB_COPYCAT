class AddTypeToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review_type, :string
    remove_column :reviews, :from_user_to_car
  end
end
