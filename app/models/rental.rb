class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start_date, :end_date, presence: true

  def duration
    (self.end_date - self.start_date) / (60*60*24)
  end

  def days
    duration
    if duration.round > 1
      day = 'days'
    else
      day = 'day'
    end
    return "#{duration.round} #{day}"
  end

  def price
    duration
    duration * self.car.price_per_day
  end

  def finished?
    self.end_date <= Time.zone.now
  end
end
