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

ActiveRecord::Schema.define(version: 20140219154749) do

  create_table "runners", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "bio"
    t.integer  "age"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "shoes", force: true do |t|
    t.integer  "runner_id"
    t.text     "nombre"
    t.integer  "totalkms"
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
