# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_17_192442) do
  create_table "educational_institutions", force: :cascade do |t|
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "tipo"
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.string "course_name"
    t.decimal "course_total_value", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.integer "due_date"
    t.integer "educational_institution_id", null: false
    t.integer "max_payments"
    t.string "status", default: "active"
    t.integer "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["educational_institution_id"], name: "index_enrollments_on_educational_institution_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "enrollment_id", null: false
    t.decimal "invoice_amount", precision: 10, scale: 2
    t.date "invoice_due_date"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["enrollment_id"], name: "index_invoices_on_enrollment_id"
  end

  create_table "students", force: :cascade do |t|
    t.date "birthdate"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.string "gender"
    t.string "name"
    t.string "payment_method"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "educational_institutions"
  add_foreign_key "enrollments", "students"
  add_foreign_key "invoices", "enrollments"
end
