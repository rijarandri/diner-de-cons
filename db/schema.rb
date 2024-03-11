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

ActiveRecord::Schema[7.1].define(version: 2024_03_11_155912) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.boolean "accepted"
    t.bigint "user_id", null: false
    t.bigint "con_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["con_id"], name: "index_bookings_on_con_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cons", force: :cascade do |t|
    t.string "name"
    t.text "decription"
    t.integer "price"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "mail"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "cons"
  add_foreign_key "bookings", "users"
  add_foreign_key "cons", "users"
end
