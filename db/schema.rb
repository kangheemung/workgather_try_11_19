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

ActiveRecord::Schema.define(version: 2022_12_03_110730) do

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "planner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planners", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "gender"
    t.string "planner_profile"
    t.text "p_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "content"
    t.integer "user_id"
    t.integer "score"
    t.integer "workshop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "planner_id"
    t.string "planner_profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.integer "gender"
    t.string "u_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshops", force: :cascade do |t|
    t.string "w_title"
    t.string "w_theme"
    t.string "image"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.integer "planner_id"
    t.text "w_detail"
    t.string "time"
    t.string "personnel"
    t.text "precautions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
