class Invoice < ApplicationRecord
  STATUS =["open","overdue","paid","cancelled","refunded","refund_pending",]
  belongs_to :enrollment
  validates :invoice_amount, presence:true
  validates :invoice_due_date, presence:true
  validates :status, presence:true
  validates :status, inclusion: {in: STATUS}


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

end