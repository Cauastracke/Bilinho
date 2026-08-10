class Enrollment < ApplicationRecord
  belongs_to :educational_institution
  belongs_to :student
  has_many :invoices
  validates :course_total_value, presence: true, numericality: {greater_than: 0}
  validates :max_payments, presence: true, numericality:{greater_than_or_equal_to: 1}
  validates :due_date, presence: true, numericality:{ greater_than_or_equal_to: 1}
  validates :due_date, presence: true, numericality:{ less_than_or_equal_to: 31}
  validates :course_name, presence: true
  validates :student_id, presence: true
  validates :educational_institution_id, presence: true

  after_create :create_invoices

  private
    def create_invoices
        max_payments.times do |i|
  
          invoice_amount = course_total_value/max_payments
          initial_date = Date.today
          this_month_due_date = initial_date.change(day: due_date) +i.months

          if this_month_due_date.month == 2 && due_date > 28
            invoice_due_date = this_month_due_date.end_of_month
          end

          if due_date == 31
             invoice_due_date = this_month_due_date.end_of_month
          end

          if due_date <= initial_date.day
            invoice_due_date = this_month_due_date + (1).months

          else 
            invoice_due_date = this_month_due_date
          end

          status = "open"
          invoices.create!(
            invoice_amount: invoice_amount,
            invoice_due_date: invoice_due_date,
            status: status
          )
        end
    end

end

