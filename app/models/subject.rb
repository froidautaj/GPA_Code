class Subject < ApplicationRecord
  # Associations
  has_many :tutor_subjects
  has_many :tutors, through: :tutor_subjects

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :level, inclusion: { in: %w[High-School University] }
end
