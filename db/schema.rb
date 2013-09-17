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

ActiveRecord::Schema.define(version: 20130917082522) do

  create_table "android_ratings", force: true do |t|
    t.string   "android_id"
    t.decimal  "rating",     precision: 7, scale: 2
    t.integer  "votes"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "android_ratings", ["app_id"], name: "index_android_ratings_on_app_id"

  create_table "apps", force: true do |t|
    t.string   "name"
    t.string   "ios_id"
    t.string   "android_id"
    t.string   "win8_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
