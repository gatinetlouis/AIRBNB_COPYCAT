class Review < ApplicationRecord
  REVIEW_TYPES_VALUES = ["feedback_from_renter", "feedback_from_owner"]
  belongs_to :rental

  validates :title, :message, :rating, presence: true
  validates :review_type, inclusion: { in: REVIEW_TYPES_VALUES }


  def car
    self.rental.car
  end

  def reviewer
    if review_type == "feedback_from_renter"
      self.rental.user
    else
      self.rental.car.user
    end
  end

  def reviewed
    if review_type == "feedback_from_renter"
      self.rental.car.user
    else
      self.rental.user
    end
  end
end
