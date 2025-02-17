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

ActiveRecord::Schema[7.1].define(version: 2025_02_17_104135) do
  create_table "availabilities", force: :cascade do |t|
    t.integer "tutor_id", null: false
    t.integer "day_of_week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_availabilities_on_tutor_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "tutor_id", null: false
    t.integer "subject_id", null: false
    t.datetime "session_date"
    t.integer "status"
    t.string "zoom_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_bookings_on_student_id"
    t.index ["subject_id"], name: "index_bookings_on_subject_id"
    t.index ["tutor_id"], name: "index_bookings_on_tutor_id"
  end

  create_table "calendar_events", force: :cascade do |t|
    t.integer "tutor_id", null: false
    t.integer "student_id", null: false
    t.integer "booking_id", null: false
    t.datetime "event_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_calendar_events_on_booking_id"
    t.index ["student_id"], name: "index_calendar_events_on_student_id"
    t.index ["tutor_id"], name: "index_calendar_events_on_tutor_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_type"
    t.string "notification_type"
    t.text "message"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.integer "student_id", null: false
    t.decimal "amount"
    t.string "payment_method"
    t.integer "payment_status"
    t.string "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
    t.index ["student_id"], name: "index_payments_on_student_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "tutor_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_reviews_on_student_id"
    t.index ["tutor_id"], name: "index_reviews_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "phone_number"
    t.string "program_of_study"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutor_subjects", force: :cascade do |t|
    t.integer "tutor_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_tutor_subjects_on_subject_id"
    t.index ["tutor_id"], name: "index_tutor_subjects_on_tutor_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "phone_number"
    t.text "experience"
    t.text "profile_preview"
    t.string "qualification"
    t.decimal "hourly_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "badge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "availabilities", "tutors"
  add_foreign_key "bookings", "students"
  add_foreign_key "bookings", "subjects"
  add_foreign_key "bookings", "tutors"
  add_foreign_key "calendar_events", "bookings"
  add_foreign_key "calendar_events", "students"
  add_foreign_key "calendar_events", "tutors"
  add_foreign_key "notifications", "users"
  add_foreign_key "payments", "bookings"
  add_foreign_key "payments", "students"
  add_foreign_key "reviews", "students"
  add_foreign_key "reviews", "tutors"
  add_foreign_key "students", "users"
  add_foreign_key "tutor_subjects", "subjects"
  add_foreign_key "tutor_subjects", "tutors"
  add_foreign_key "tutors", "users"
end
