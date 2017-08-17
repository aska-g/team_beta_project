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

ActiveRecord::Schema.define(version: 20170817111809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.text "news_body"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["room_id"], name: "index_announcements_on_room_id"
    t.index ["student_id"], name: "index_announcements_on_student_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment_body"
    t.bigint "student_id"
    t.bigint "announcement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_comments_on_announcement_id"
    t.index ["student_id"], name: "index_comments_on_student_id"
  end

  create_table "contributor_expenses", force: :cascade do |t|
    t.integer "expense_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "payed"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "purchaser_id"
    t.string "category"
    t.text "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.float "divided_price"
    t.string "title"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number", default: 0
    t.string "name", default: ""
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "locale", default: "pl"
    t.text "bio"
    t.string "nickname"
    t.string "avatar"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["invitation_token"], name: "index_students_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_students_on_invitations_count"
    t.index ["invited_by_id"], name: "index_students_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_students_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "tenancy_contracts", force: :cascade do |t|
    t.float "rent", default: 0.0
    t.bigint "student_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_tenancy_contracts_on_room_id"
    t.index ["student_id"], name: "index_tenancy_contracts_on_student_id"
  end

  add_foreign_key "announcements", "rooms"
  add_foreign_key "announcements", "students"
  add_foreign_key "comments", "announcements"
  add_foreign_key "comments", "students"
  add_foreign_key "tenancy_contracts", "rooms"
  add_foreign_key "tenancy_contracts", "students"
end
