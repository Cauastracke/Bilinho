class Enrollment < ApplicationRecord
  belongs_to :educational_institution
  belongs_to :student
  validates :course_total_value, presence: true, numericality: {greather_than: 0}
  validates :max_payments, presence: true, numericality:{greather_than: 1}
  validates :due_date, presence: true, numericality:{ greater_than_or_equal_to: 1}
  validates :due_date, presence: true, numericality:{ less_than_or_equal_to: 31}
  validates :course_name, presence: true
  validates :student_id, presence: true
  validates :educational_institution_id, presence: true
end
