class Payment < ApplicationRecord
  # Associations
  belongs_to :booking
  belongs_to :student

  # Enum for payment status
  enum payment_status: { pending: 0, paid: 1, failed: 2 }

  # Validations
  validates :amount, numerically: { greater_than: 0 }
  validates :payment_method, inclusion: { in: %w[CreditCard PayPal ApplePay MobileWallet] }

  # Callbacks
  after_create :send_payment_confirmation

  private

  def send_payment_confirmation
    Notification.create(
      user: student.user,
      notification_type: "payment_received",
      message: "Your payment of $#{amount} has been received!"
    )
  end
end
