class CalendarEvent < ApplicationRecord
  # Associations
  belongs_to :tutor
  belongs_to :student
  belongs_to :booking

  # Validations
  validates :event_type, presence: true
end
