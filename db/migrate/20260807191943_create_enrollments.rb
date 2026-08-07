class CreateEnrollments < ActiveRecord::Migration[8.1]
  def change
    create_table :enrollments do |t|
      t.float :course_total_value
      t.integer :max_payments
      t.integer :due_date
      t.string :course_name
      t.references :educational_institution, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
