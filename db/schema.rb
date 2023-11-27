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

ActiveRecord::Schema.define(version: 2023_11_23_063209) do

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "planner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planners", force: :cascade do |t|
    t.string "planner_name"
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
    t.integer "workshop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "workshop_id"
    t.string "name"
    t.integer "participant"
    t.datetime "date_time_1"
    t.datetime "date_time_2"
    t.datetime "date_time_3"
    t.boolean "check_box"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stars", force: :cascade do |t|
    t.integer "score"
    t.integer "user_id"
    t.integer "workshop_id"
    t.string "content"
    t.integer "post_id"
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

  create_table "workshop_posts", force: :cascade do |t|
    t.integer "workshop_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_workshop_posts_on_post_id"
    t.index ["workshop_id"], name: "index_workshop_posts_on_workshop_id"
  end

  create_table "workshops", force: :cascade do |t|
    t.string "w_title"
    t.string "w_theme"
    t.string "image"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.integer "planner_id", null: false
    t.text "w_detail"
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "personnel"
    t.text "precautions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planner_id"], name: "index_workshops_on_planner_id"
  end

end
