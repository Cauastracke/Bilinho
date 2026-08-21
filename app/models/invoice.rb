class Invoice < ApplicationRecord
  STATUS =["open","overdue","paid","cancelled","refunded","refund_pending",]
  belongs_to :enrollment
  validates :invoice_amount, presence:true
  validates :invoice_due_date, presence:true 
  validates :status, presence:true
  validates :status, inclusion: {in: STATUS}
  validate :status_must_stay_valid_when_enrollment_completed


  after_update :complete_enrollment_if_fully_paid

  def complete_enrollment_if_fully_paid
    if saved_change_to_status?
      new_status = status
      all_invoices_paid = enrollment.invoices.where.not(status: "paid").none?
      if new_status == "paid" && all_invoices_paid == true
        enrollment.update!(
          status: "completed"
        )
      end
    end
  end

  def status_must_stay_valid_when_enrollment_completed
  return unless enrollment&.status == "completed"
  return if ["paid", "refund_pending", "refunded"].include?(status)

  errors.add(:status, "a matrícula já está concluída, não é possível alterar essa fatura para open, overdue ou cancelled")
  end

  def reopen
    enrollment.update!(status: "active") if enrollment.status == "completed"
    update!(status: "open")
  end
end