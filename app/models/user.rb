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
end
