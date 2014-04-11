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

ActiveRecord::Schema.define(version: 20140403181704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "hq_address"
    t.string   "hq_city"
    t.string   "hq_state"
    t.string   "country"
    t.text     "description"
    t.string   "phone"
    t.string   "email"
    t.integer  "owner_id"
    t.string   "contact_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_guides", force: true do |t|
    t.integer  "company_id"
    t.integer  "guide_id"
    t.boolean  "guide_confirmed"
    t.boolean  "company_confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "difficulties", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.integer  "location_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guides", force: true do |t|
    t.string   "user_id"
    t.string   "intro"
    t.string   "bio"
    t.boolean  "approved"
    t.boolean  "banned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "activity_id"
    t.integer  "location_id"
    t.integer  "feature_id"
    t.integer  "route_id"
    t.integer  "client_id"
    t.integer  "guide_id"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "lengths", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "description"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "agency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "company_id"
    t.integer  "trip_id"
    t.integer  "trip_date_id"
    t.integer  "number_of_people"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buyer_id"
    t.integer  "first_person_cost"
    t.integer  "second_person_cost"
  end

  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.integer  "feature_id"
    t.string   "name"
    t.text     "description"
    t.string   "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_dates", force: true do |t|
    t.integer  "trip_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "activity_id"
    t.integer  "guide_id"
    t.integer  "difficulty_id"
    t.integer  "location_id"
    t.integer  "route_id"
    t.integer  "feature_id"
    t.string   "latitude"
    t.string   "longitude"
    t.text     "required_gear"
    t.text     "supplied_gear"
    t.text     "special_directions"
    t.integer  "offer_capacity"
    t.integer  "trip_length_id"
    t.text     "description"
    t.text     "itinerary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_person_cost"
    t.integer  "second_person_cost"
    t.integer  "company_id"
  end

  create_table "users", force: true do |t|
    t.boolean  "admin"
    t.integer  "guide_status"
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "phone"
    t.date     "birthday"
    t.string   "gender"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "emergency_first"
    t.string   "emergency_last"
    t.string   "emergency_relationship"
    t.string   "emergency_phone"
    t.string   "emergency_email"
    t.string   "emergency_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
