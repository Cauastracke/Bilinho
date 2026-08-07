class DropEnrollments < ActiveRecord::Migration[8.1]
  def change
    drop_table :enrollments do |t|
      t.string "course_name"
      t.string "course_total_value"
      t.integer "due_date"
      t.references "educational_institution", null: false, foreign_key: true
      t.integer "max_payments"
      t.references "student", null: false, foreign_key: true
      t.timestamps
    end
  end
end
