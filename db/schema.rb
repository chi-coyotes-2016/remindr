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

ActiveRecord::Schema.define(version: 20161116210925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groupings", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.integer  "reminder_id"
    t.integer  "contact_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.text     "body"
    t.integer  "author_id"
    t.datetime "time_to_go_out"
    t.integer  "number_of_recurrences"
    t.string   "time_of_recurrence"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["time_to_go_out"], name: "index_reminders_on_time_to_go_out", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
