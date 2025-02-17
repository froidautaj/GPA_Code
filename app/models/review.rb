class Review < ApplicationRecord
  # Associations
  belongs_to :student
  belongs_to :tutor

  # Validations
  validates :rating, inclusion: { in: 1..5 }
  validates :comment, length: { minimum: 10, maximum: 1000 }
end
