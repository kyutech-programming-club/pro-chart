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

ActiveRecord::Schema.define(version: 2019_06_22_153326) do

  create_table "elems", force: :cascade do |t|
    t.integer "lang_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lang_id"], name: "index_elems_on_lang_id"
  end

  create_table "langs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_elems", force: :cascade do |t|
    t.integer "record_id"
    t.integer "elem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elem_id"], name: "index_record_elems_on_elem_id"
    t.index ["record_id"], name: "index_record_elems_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.integer "user_id"
    t.date "r_date"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "remember_digest"
  end

end
