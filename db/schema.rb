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

ActiveRecord::Schema[7.0].define(version: 2023_02_27_222714) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "key_price"
    t.string "status"
    t.bigint "platform_id", null: false
    t.bigint "house_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_bookings_on_house_id"
    t.index ["platform_id"], name: "index_bookings_on_platform_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_platforms_on_house_id"
  end

  create_table "spendings", force: :cascade do |t|
    t.float "amount"
    t.date "date"
    t.string "category"
    t.text "details"
    t.bigint "tribe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tribe_id"], name: "index_spendings_on_tribe_id"
  end

  create_table "tribes", force: :cascade do |t|
    t.integer "keys"
    t.string "color"
    t.float "shareholding"
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_tribes_on_house_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.bigint "tribe_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tribe_id"], name: "index_users_on_tribe_id"
  end

  add_foreign_key "bookings", "houses"
  add_foreign_key "bookings", "platforms"
  add_foreign_key "bookings", "users"
  add_foreign_key "platforms", "houses"
  add_foreign_key "spendings", "tribes"
  add_foreign_key "tribes", "houses"
  add_foreign_key "users", "tribes"
end
