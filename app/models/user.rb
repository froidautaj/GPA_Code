class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Devise authentication (handles sign in, sign up, password reset, etc.)
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :trackable

  # Associations
  has_one :student
  has_one :tutor
  has_many :notifications

  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :role, inclusion: { in: %w[student tutor], message: "%{value} is not a valid role"}

  # Callbacks
  before_create :set_default_role

  private

  def set_default_role
    self.role ||= "student" # Default role is student unless specified
  end
end
