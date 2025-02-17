class Booking < ApplicationRecord

  # Associations
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject
  has_one :payment
  has_one :calendar_event

  # Enum for booking status
  enum status: { pending: 0, confirmed: 1, completed: 2, cancelled: 3 }

  # Validations
  validates :session_date, presence: true

  # Callbacks

  after_create :send_booking_confirmation

  private

  def send_booking_confirmation
    Notification.create(
      user: student,
      notification_type: "booking_confirmed",
      message: "Your booking has been confirmed!"
    )
  end
end
