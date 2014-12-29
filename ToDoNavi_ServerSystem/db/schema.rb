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

ActiveRecord::Schema.define(version: 20141204172230) do

  create_table "adminusers", force: true do |t|
    t.string   "user"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "administrator"
  end

  create_table "genres", force: true do |t|
    t.integer  "genre_number", null: false
    t.string   "genre_name",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itemprices", force: true do |t|
    t.integer  "store_id",     null: false
    t.integer  "item_id",      null: false
    t.integer  "store_number", null: false
    t.integer  "item_number",  null: false
    t.integer  "prices",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itemprices", ["item_id"], name: "index_itemprices_on_item_id"
  add_index "itemprices", ["store_id"], name: "index_itemprices_on_store_id"

  create_table "items", force: true do |t|
    t.integer  "genre_id",     null: false
    t.integer  "item_number",  null: false
    t.string   "item_name",    null: false
    t.integer  "genre_number", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["genre_id"], name: "index_items_on_genre_id"

  create_table "locationinfos", force: true do |t|
    t.integer  "store_id",             null: false
    t.integer  "location_info_number", null: false
    t.decimal  "long",                 null: false
    t.decimal  "lat",                  null: false
    t.integer  "store_number",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locationinfos", ["store_id"], name: "index_locationinfos_on_store_id"

  create_table "stores", force: true do |t|
    t.integer  "store_number", null: false
    t.string   "store_name",   null: false
    t.string   "address"
    t.string   "phone_number"
    t.integer  "open_time",    null: false
    t.integer  "close_time",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wifiinfos", force: true do |t|
    t.integer  "store_id",         null: false
    t.integer  "wifi_info_number", null: false
    t.string   "ssid",             null: false
    t.string   "bssid",            null: false
    t.integer  "store_number",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wifiinfos", ["store_id"], name: "index_wifiinfos_on_store_id"

end
