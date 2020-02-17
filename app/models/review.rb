class Review < ApplicationRecord
  belongs_to :rental
  belongs_to :user, through: :rental
  belongs_to :car, through: :rental

  validates :title, :message, :rating, presence: true
end
