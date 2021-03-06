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

ActiveRecord::Schema.define(version: 20150818160158) do

  create_table "admins", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "fullName"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "content_attachments", force: :cascade do |t|
    t.integer  "content_id"
    t.string   "image"
    t.datetime "created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.integer  "author"
    t.text     "body"
    t.string   "image"
    t.integer  "external_id",   limit: 8
    t.string   "external_link"
    t.string   "kind"
    t.string   "rating"
    t.string   "location"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal"
    t.string   "ip"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "is_active"
    t.boolean  "has_comments"
    t.datetime "created"
    t.datetime "updated"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "post_attachments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.string   "address"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal"
    t.string   "ip"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "is_active"
    t.boolean  "has_comments"
    t.date     "date"
    t.time     "time"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "body"
    t.string   "user"
    t.string   "image"
    t.string   "location"
    t.string   "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
    t.date     "date"
    t.string   "Latitude"
    t.string   "Longitude"
  end

end
