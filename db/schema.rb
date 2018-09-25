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

ActiveRecord::Schema.define(version: 2018_09_24_190503) do

  create_table "applications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "reg_number"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "telephone"
    t.string "sex"
    t.string "department"
    t.integer "level"
    t.string "academic_year"
    t.string "sponsor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.integer "is_dean_approve", default: 2, null: false
    t.integer "is_hod_approve", default: 2, null: false
    t.integer "is_finance_approve", default: 2, null: false
    t.integer "is_warden_approve", default: 2, null: false
    t.integer "is_librarian_approve", default: 2, null: false
    t.integer "student_id"
    t.string "dean_comment"
    t.string "hod_comment"
    t.string "warden_comment"
    t.string "finance_comment"
    t.string "librarian_comment"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "reg_number"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "telephone"
    t.string "sex"
    t.string "department"
    t.integer "level"
    t.string "academic_year"
    t.string "sponsor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_hash"
    t.string "password_salt"
    t.string "auth_token"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "password_hash"
    t.string "password_salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "auth_token"
  end

end
