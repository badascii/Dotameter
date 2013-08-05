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

ActiveRecord::Schema.define(version: 20130804225541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "heroes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "valve_id"
    t.string   "name"
  end

  create_table "matches", force: true do |t|
    t.boolean  "radiant_win"
    t.integer  "valve_match_id"
    t.integer  "valve_seq_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
    t.integer  "start_time",              limit: 8
    t.integer  "tower_status_radiant"
    t.integer  "tower_status_dire"
    t.integer  "barracks_status_radiant"
    t.integer  "barracks_status_dire"
  end

end
