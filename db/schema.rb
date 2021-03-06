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

ActiveRecord::Schema.define(version: 20140831172549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: true do |t|
    t.datetime "due_date"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conference_topics", force: true do |t|
    t.integer  "conference_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.boolean  "code_of_conduct",       default: false
    t.boolean  "childcare",             default: false
    t.integer  "last_years_attendance", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
