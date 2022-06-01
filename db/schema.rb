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

ActiveRecord::Schema.define(version: 2022_05_18_014208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rounds", force: :cascade do |t|
    t.string "title"
    t.integer "pick_one"
    t.integer "pick_two"
    t.integer "pick_three"
    t.integer "pick_four"
    t.integer "pick_five"
    t.integer "pick_six"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_rounds", force: :cascade do |t|
    t.bigint "round_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["round_id"], name: "index_user_rounds_on_round_id"
    t.index ["user_id"], name: "index_user_rounds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
  end

  add_foreign_key "user_rounds", "rounds"
  add_foreign_key "user_rounds", "users"
end
