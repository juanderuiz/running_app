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

ActiveRecord::Schema.define(version: 20140901165638) do

  create_table "runners", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "bio"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.date     "datebirth"
  end

  add_index "runners", ["email"], name: "index_runners_on_email", unique: true
  add_index "runners", ["reset_password_token"], name: "index_runners_on_reset_password_token", unique: true

  create_table "shoes", force: true do |t|
    t.integer  "runner_id"
    t.text     "nombre"
    t.decimal  "totalkms",            precision: 4, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "tipos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", force: true do |t|
    t.decimal  "kms",                     precision: 5, scale: 2
    t.integer  "time",        limit: 255
    t.date     "date"
    t.integer  "runner_id"
    t.string   "description"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "seconds"
    t.integer  "shoe_id"
  end

end
