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

ActiveRecord::Schema.define(version: 20140924185057) do

  create_table "shortened_urls", force: true do |t|
    t.integer  "submitter_id"
    t.string   "long_url",      limit: 1000
    t.string   "shortened_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["shortened_url"], name: "index_shortened_urls_on_shortened_url"
  add_index "shortened_urls", ["submitter_id"], name: "index_shortened_urls_on_submitter_id"

  create_table "users", force: true do |t|
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"

end