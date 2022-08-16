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

ActiveRecord::Schema[7.0].define(version: 2022_08_16_130717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "content"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_answers_on_booking_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "user_id", null: false
    t.string "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_bookings_on_trip_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_bookmarks_on_trip_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.text "content"
    t.string "question_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_questions_on_trip_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_tags", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_trip_tags_on_tag_id"
    t.index ["trip_id"], name: "index_trip_tags_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "image"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.bigint "user_id", null: false
    t.string "status"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "bookings"
  add_foreign_key "answers", "questions"
  add_foreign_key "bookings", "trips"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookmarks", "trips"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "questions", "trips"
  add_foreign_key "trip_tags", "tags"
  add_foreign_key "trip_tags", "trips"
  add_foreign_key "trips", "users"
end
