class Tutor < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings
  has_many :subjects, through: :tutor_subjects
  has_many :reviews
  has_many :availabilities

  # Validations
  validates :phone_number, presence: true, uniqueness: true
  validates :experience, presence: true, length: { minimum: 50 }
  validates :hourly_rate, presence: true, numerically: { greater_than: 0 }

  # Custom Method
  def average_rating
    reviews.average(:rating) || 0
  end
end
