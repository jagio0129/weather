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

ActiveRecord::Schema.define(version: 20161026213719) do

  create_table "amedas_data", force: :cascade do |t|
    t.string   "prefecture"
    t.integer  "amedas_id"
    t.string   "category"
    t.string   "amedas_name"
    t.string   "phonetic"
    t.text     "address"
    t.integer  "latitude_degrees"
    t.float    "latitude_minutes"
    t.integer  "longitude_degrees"
    t.float    "longitude_minutes"
    t.integer  "above_sea_level"
    t.float    "height_of_the_anemometer"
    t.float    "height_of_the_thermometer"
    t.string   "observation_start_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "snow_amedas_data", force: :cascade do |t|
    t.string   "prefecture"
    t.integer  "amedas_id"
    t.string   "category"
    t.string   "amedas_name"
    t.string   "phonetic"
    t.text     "address"
    t.integer  "latitude_degrees"
    t.float    "latitude_minutes"
    t.integer  "longitude_degrees"
    t.float    "longitude_minutes"
    t.integer  "above_sea_level"
    t.string   "observation_start_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "weather_data", force: :cascade do |t|
    t.integer  "time"
    t.float    "temperature"
    t.float    "precipitation"
    t.string   "wind_direction"
    t.float    "wind_speed"
    t.float    "sunshine"
    t.integer  "depth_of_snow"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "amedas_datum_id"
    t.integer  "snow_amedas_datum_id"
  end

end
