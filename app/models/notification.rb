class Notification < ApplicationRecord
  # Polymorphic association (used for students and tutors)
  belongs_to :user, polymorphic: true

  # Validations
  validates :notification_type, presence: true
  validates :message, presence: true

  # Callbacks
  after_create :send_email_notification

  private

  def send_email_notification
    puts "Email sent to #{user.email}: #{message}"
  end
end
