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

ActiveRecord::Schema.define(version: 20201203042908) do

  create_table "bows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "maker_id"
    t.string  "instrument"
    t.string  "brand"
    t.integer "last_sold_price"
    t.string  "last_sold_date"
    t.string  "year_made"
    t.string  "weight"
    t.string  "balance"
    t.string  "length"
    t.string  "strength"
    t.string  "materials"
    t.string  "shape"
    t.string  "notes"
  end

  create_table "makers", force: :cascade do |t|
    t.string  "name"
    t.string  "nationality"
    t.integer "year_born"
    t.integer "year_died"
    t.string  "city"
    t.string  "bio"
  end

  create_table "users", force: :cascade do |t|
    t.string "user"
    t.string "email"
    t.string "password_digest"
  end

end
