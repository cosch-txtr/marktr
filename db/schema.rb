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

ActiveRecord::Schema.define(version: 20140124110339) do

  create_table "android_daily_ratings", force: true do |t|
    t.integer  "app_id"
    t.datetime "date"
    t.decimal  "rating",     precision: 7, scale: 2
    t.integer  "votes"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "android_daily_ratings", ["app_id"], name: "index_android_daily_ratings_on_app_id"

  create_table "android_ratings", force: true do |t|
    t.string   "android_id"
    t.decimal  "rating",     precision: 7, scale: 2
    t.integer  "votes"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  add_index "android_ratings", ["app_id"], name: "index_android_ratings_on_app_id"

  create_table "apps", force: true do |t|
    t.string   "name"
    t.string   "itunes_id"
    t.string   "android_id"
    t.string   "win8_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "itunes_country"
    t.string   "win8_country"
    t.integer  "country_id"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "itunes_country"
    t.string   "win8_country"
    t.string   "android_country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itunes_ratings", force: true do |t|
    t.string   "itunes_id"
    t.decimal  "rating",     precision: 7, scale: 2
    t.integer  "votes"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  add_index "itunes_ratings", ["app_id"], name: "index_itunes_ratings_on_app_id"

  create_table "joined_ratings", force: true do |t|
    t.string   "itunes_id"
    t.decimal  "itunes_rating",  precision: 7, scale: 2
    t.integer  "itunes_votes"
    t.string   "android_id"
    t.decimal  "android_rating", precision: 7, scale: 2
    t.integer  "android_votes"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "win8_rating",    precision: 7, scale: 2
    t.integer  "win8_votes"
    t.integer  "country_id"
  end

  add_index "joined_ratings", ["app_id"], name: "index_joined_ratings_on_app_id"

  create_table "win8_ratings", force: true do |t|
    t.string   "win8_id"
    t.decimal  "rating",     precision: 7, scale: 2
    t.integer  "votes"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  add_index "win8_ratings", ["app_id"], name: "index_win8_ratings_on_app_id"

end
