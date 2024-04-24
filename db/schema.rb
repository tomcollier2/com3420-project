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

ActiveRecord::Schema[7.0].define(version: 2024_04_22_125006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatar_ownerships", force: :cascade do |t|
    t.string "avatar"
    t.string "fileLocation"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avatars", force: :cascade do |t|
    t.string "file_location"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "instruments", force: :cascade do |t|
    t.bigint "tutor_id"
    t.bigint "student_id"
    t.string "instrument"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_instruments_on_student_id"
    t.index ["tutor_id"], name: "index_instruments_on_tutor_id"
  end

  create_table "music_sessions", force: :cascade do |t|
    t.bigint "tutor_id"
    t.string "title"
    t.string "description"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_music_sessions_on_tutor_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "student_sessions", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "music_session_id"
    t.boolean "completed"
    t.datetime "time_completed"
    t.integer "rating"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_session_id"], name: "index_student_sessions_on_music_session_id"
    t.index ["student_id"], name: "index_student_sessions_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "studentID"
    t.string "forename"
    t.string "surname"
    t.string "experience"
    t.integer "coins"
    t.integer "dayStreak"
    t.string "avatarID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "music_session_id"
    t.string "title"
    t.string "description"
    t.integer "reward"
    t.integer "practice_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "record_time"
    t.index ["music_session_id"], name: "index_tasks_on_music_session_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "tutorID"
    t.string "forename"
    t.string "surname"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

end
