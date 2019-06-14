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

ActiveRecord::Schema.define(version: 20190614052207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisements", force: :cascade do |t|
    t.date "date"
    t.integer "units"
  end

  create_table "banner_people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banner_persons", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "image"
    t.index ["first_name"], name: "index_banner_persons_on_first_name"
    t.index ["last_name"], name: "index_banner_persons_on_last_name"
  end

  create_table "handouts", force: :cascade do |t|
    t.date "date"
    t.integer "units"
  end

  create_table "houses", force: :cascade do |t|
    t.integer "loyalty_range", array: true
  end

  create_table "loyalty_points", force: :cascade do |t|
    t.date "date"
    t.integer "pts"
    t.index ["date"], name: "index_loyalty_points_on_date"
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
