class ChangeMoneyFieldsToDecimal < ActiveRecord::Migration[8.1]
  def change
    change_column :enrollments,
                  :course_total_value,
                  :decimal,
                  precision: 10,
                  scale: 2

    change_column :invoices,
                  :invoice_amount,
                  :decimal,
                  precision: 10,
                  scale: 2
  end
end