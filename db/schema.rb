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

ActiveRecord::Schema.define(version: 20190704091039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisements", force: :cascade do |t|
    t.bigint "membership_id"
    t.date "date"
    t.integer "units"
    t.index ["membership_id"], name: "index_advisements_on_membership_id"
  end

  create_table "banner_people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "image"
    t.index ["first_name"], name: "index_banner_people_on_first_name"
    t.index ["last_name"], name: "index_banner_people_on_last_name"
  end

  create_table "handouts", force: :cascade do |t|
    t.bigint "membership_id"
    t.date "date"
    t.integer "units"
    t.index ["membership_id"], name: "index_handouts_on_membership_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.integer "loyalty_range", array: true
    t.string "image"
  end

  create_table "loyalty_points", force: :cascade do |t|
    t.bigint "membership_id"
    t.date "date"
    t.integer "pts"
    t.index ["date"], name: "index_loyalty_points_on_date"
    t.index ["membership_id"], name: "index_loyalty_points_on_membership_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "house_id"
    t.bigint "banner_person_id"
    t.boolean "active"
    t.string "hsid"
    t.date "date_added"
    t.date "date_left"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_memberships_on_active"
    t.index ["banner_person_id"], name: "index_memberships_on_banner_person_id"
    t.index ["house_id"], name: "index_memberships_on_house_id"
  end

end
