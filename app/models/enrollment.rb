class Enrollment < ApplicationRecord
  belongs_to :educational_institution
  belongs_to :student
  has_many :invoices
  STATUS =["active", "cancelled", "completed"]
  validates :course_total_value, presence: true, numericality: {greater_than: 0}
  validates :max_payments, presence: true, numericality:{greater_than_or_equal_to: 1}
  validates :due_date, presence: true, numericality:{ greater_than_or_equal_to: 1}
  validates :due_date, presence: true, numericality:{ less_than_or_equal_to: 31}
  validates :course_name, presence: true
  validates :student_id, presence: true
  validates :status, presence: true
  validates :status, inclusion: {in: STATUS}

  validates :educational_institution_id, presence: true

  validate :status_completed_requires_all_invoices_paid

  after_create :create_invoices

  private

  def create_invoices
    today = Date.today
    due_date_already_passed_this_month = due_date <= today.day

    if due_date_already_passed_this_month
      base_month = today + 1.month
    else
      base_month = today
    end

    invoice_amount = course_total_value / max_payments

    max_payments.times do |i|
      current_month = base_month + i.months

      last_day_of_month = current_month.end_of_month.day

      if due_date > last_day_of_month
        invoice_day = last_day_of_month
      else
        invoice_day = due_date
      end

      invoice_due_date = current_month.change(day: invoice_day)

      invoices.create!(
        invoice_amount: invoice_amount,
        invoice_due_date: invoice_due_date,
        status: "open"
      )
    end
  end
  def status_completed_requires_all_invoices_paid
    return unless status == "completed"
    all_invoices_paid = invoices.where.not(status: "paid").none?

    errors.add(:status, "não pode ser completed com faturas em aberto") unless all_invoices_paid
  end
end