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

ActiveRecord::Schema.define(version: 20160308212125) do

  create_table "headlines", force: :cascade do |t|
    t.text     "headline_text"
    t.boolean  "is_repeat"
    t.boolean  "is_primary"
    t.boolean  "has_moved"
    t.integer  "response_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "headlines", ["response_id"], name: "index_headlines_on_response_id"

  create_table "logs", force: :cascade do |t|
    t.datetime "timestamp"
    t.string   "code"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.datetime "response_time"
    t.text     "raw_html"
    t.integer  "source_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "responses", ["source_id"], name: "index_responses_on_source_id"

  create_table "sources", force: :cascade do |t|
    t.text     "url"
    t.string   "main_header_id"
    t.string   "main_header_class"
    t.string   "sub_header_id"
    t.string   "sub_header_class"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
