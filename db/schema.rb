# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_07_193639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role", default: 0
  end

  create_table "viewing_parties", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.integer "duration"
    t.bigint "user_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_viewing_parties_on_user_id"
  end

  create_table "viewing_party_users", force: :cascade do |t|
    t.bigint "viewing_party_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_viewing_party_users_on_user_id"
    t.index ["viewing_party_id"], name: "index_viewing_party_users_on_viewing_party_id"
  end

  add_foreign_key "viewing_party_users", "users"
  add_foreign_key "viewing_party_users", "viewing_parties"
end
