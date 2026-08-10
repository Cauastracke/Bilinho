class Invoice < ApplicationRecord
  STATUS =["open","overdue","paid"]
  belongs_to :enrollment
  validates :invoice_amount, presence:true
  validates :invoice_due_date, presence:true
  validates :status, presence:true
  validates :status, inclusion: {in: STATUS}
end
