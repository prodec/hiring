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

ActiveRecord::Schema.define(version: 20150208200156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conservations", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string   "name"
    t.integer  "conservation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "elements", ["conservation_id"], name: "index_elements_on_conservation_id", using: :btree

  create_table "highways", force: :cascade do |t|
    t.string   "name"
    t.integer  "direction_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "highways", ["direction_id"], name: "index_highways_on_direction_id", using: :btree

  add_foreign_key "elements", "conservations"
  add_foreign_key "highways", "directions"
end
