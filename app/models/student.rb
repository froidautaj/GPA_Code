class Student < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings
  has_many :payments, through: :bookings
  has_many :reviews

  # Validations
  validates :phone_number, presence: true, uniqueness: true
  validates :program_of_study, presence: true
end
