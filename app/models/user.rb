class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rentals, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :reviews, through: :rentals
  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :phone_number, presence: true
  has_one_attached :photo

  def renters
    renters = []
    self.cars.each do |car|
      car.rentals.each do |rental|
        renters << rental
      end
    end
    return renters
  end

  def any_new_trip?
    answer = []
    # unless self.rentals.blank?
    self.rentals.each do |rental|
      answer << rental.finished?
    end
    answer.include?(false)
  end

  def any_new_renter?
    answer = []
    self.renters.each do |rental|
      answer << rental.finished?
    end
    answer.include?(false)
  end
end
