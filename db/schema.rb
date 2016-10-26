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

ActiveRecord::Schema.define(version: 20161026181910) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "auth_token",             default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["auth_token"], name: "index_admins_on_auth_token", unique: true
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "file_uploads", force: :cascade do |t|
    t.string   "url"
    t.string   "raw"
    t.string   "hash_id"
    t.string   "name"
    t.string   "ext"
    t.integer  "uploader_id"
    t.string   "uploader_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_degrees", force: :cascade do |t|
    t.string   "degree"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vote_id"
    t.integer  "vote_option_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_votes", ["user_id"], name: "index_user_votes_on_user_id"
  add_index "user_votes", ["vote_id"], name: "index_user_votes_on_vote_id"
  add_index "user_votes", ["vote_option_id"], name: "index_user_votes_on_vote_option_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "auth_token",             default: ""
    t.string   "forgot_code"
    t.string   "fullname"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "dateofbirth"
    t.text     "bio"
    t.string   "job"
    t.integer  "user_degree_id"
    t.string   "gender"
    t.string   "phone_number"
    t.boolean  "verified",               default: false
    t.string   "city"
    t.string   "avatar_url"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["user_degree_id"], name: "index_users_on_user_degree_id"

  create_table "vote_categories", force: :cascade do |t|
    t.string   "category"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vote_options", force: :cascade do |t|
    t.string   "title"
    t.integer  "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vote_options", ["vote_id"], name: "index_vote_options_on_vote_id"

# Could not dump table "votes" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
