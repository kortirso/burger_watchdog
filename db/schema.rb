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

ActiveRecord::Schema.define(version: 20151120112437) do

  create_table "centrals", force: :cascade do |t|
    t.integer  "monster_timeout",     default: 30
    t.integer  "monster_percent",     default: 5
    t.integer  "monster_heal",        default: 200
    t.integer  "streak_bonus",        default: 3
    t.integer  "corporate",           default: 150
    t.integer  "corporate_periods",   default: 10
    t.integer  "corporate_koef",      default: 2
    t.integer  "corporate_minimum",   default: 90
    t.integer  "corporate_maximum",   default: 210
    t.integer  "speed_koef",          default: 2
    t.integer  "speed_count",         default: 10
    t.integer  "speed_times",         default: 30
    t.integer  "triangle_koef",       default: 2
    t.integer  "manager_koef",        default: 2
    t.integer  "level_percent",       default: 1
    t.integer  "level_point",         default: 100
    t.string   "triangle_periods",    default: ""
    t.integer  "green_mark_points",   default: 3
    t.integer  "yellow_mark_points",  default: 2
    t.integer  "red_mark_points",     default: -5
    t.integer  "default_mark_points", default: 1
    t.float    "disposals",           default: 10000.0
    t.integer  "dessert_bonus",       default: 5
    t.integer  "max_green_time",      default: 90
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "gameservers", force: :cascade do |t|
    t.string   "ip"
    t.string   "address"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "status",         default: true
    t.string   "open",           default: "false"
    t.boolean  "desk_check",     default: true
    t.integer  "uptime",         default: 0
    t.integer  "uptime_periods", default: 0
    t.integer  "version",        default: 1
  end

  create_table "workdays", force: :cascade do |t|
    t.integer  "restaurant"
    t.integer  "mains"
    t.integer  "sauces"
    t.integer  "desserts"
    t.integer  "drinks"
    t.integer  "garnirs"
    t.integer  "check"
    t.integer  "time"
    t.integer  "dish_count"
    t.integer  "triangles"
    t.integer  "full_triangles"
    t.integer  "points"
    t.integer  "smena"
    t.integer  "number"
    t.integer  "dishes"
    t.integer  "yellow"
    t.integer  "red"
    t.integer  "green"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "day"
  end

end
