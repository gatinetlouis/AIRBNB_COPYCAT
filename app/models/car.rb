class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals

  validates :brand, :model, :pick_up_address, :price_per_day, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

  has_one_attached :photo
  validates :photo, presence: true

  def renter_reviews
    renter_reviews = []
    self.rentals.each do |rental|
      renter_review = rental.reviews.select { |review| review.review_type == "feedback_from_renter"}[0]
      unless renter_review.nil?
        renter_reviews << renter_review
      end
    end
    renter_reviews
  end
end
