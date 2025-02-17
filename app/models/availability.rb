class Availability < ApplicationRecord
  # Associations
  belongs_to :tutor

  # Validations
  validates :day_of_week, inclusion: { in: 0..6 } # 0 = Monday, 6 = Sunday
  validates :start_time, :end_time, presence: true
end
