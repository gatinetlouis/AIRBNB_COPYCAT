class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals

  validates :brand, :model, :pick_up_address, :price_per_day, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

  has_one_attached :photo
end
