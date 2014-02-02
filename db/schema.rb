# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140202102709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fa_offers", force: true do |t|
    t.integer  "student_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fa_packages", force: true do |t|
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semester_packages", force: true do |t|
    t.integer  "fa_package"
    t.string   "semester_name"
    t.float    "tuition_and_fees"
    t.float    "housing_meals"
    t.float    "books"
    t.float    "transportation"
    t.float    "other"
    t.float    "school_grant",           default: 0.0
    t.float    "pell",                   default: 0.0
    t.float    "state_grant",            default: 0.0
    t.float    "other_scholarship",      default: 0.0
    t.float    "work_study",             default: 0.0
    t.float    "perkins",                default: 0.0
    t.float    "sub_stafford",           default: 0.0
    t.float    "unsub_stafford",         default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.string   "college_name"
    t.float    "my_housing"
    t.float    "my_books"
    t.float    "my_transportation"
    t.float    "my_other"
    t.float    "my_other_scholarship"
    t.float    "my_work_study"
    t.float    "my_family_contribution"
    t.integer  "ordering"
  end

  create_table "students", force: true do |t|
    t.integer  "ssn"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "fa_package_id"
  end

end
