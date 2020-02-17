class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start_date, :end_date, presence: true
end
