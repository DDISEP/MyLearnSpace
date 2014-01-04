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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140104153056) do

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
=======
ActiveRecord::Schema.define(version: 20140102184905) do
>>>>>>> 12c50812f8b38c00bc4db2f4ff457c6d2405c4a8

  create_table "contents", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculums", force: true do |t|
    t.string   "subject"
    t.integer  "level"
    t.string   "typeOfSchool"
    t.string   "profession"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "state"
  end

<<<<<<< HEAD
  create_table "data_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fileName"
=======
  create_table "curriculums_users", force: true do |t|
    t.integer "curriculum_id"
    t.integer "user_id"
>>>>>>> 12c50812f8b38c00bc4db2f4ff457c6d2405c4a8
  end

  create_table "items", force: true do |t|
    t.string   "title"
    t.integer  "hours"
    t.string   "descriptionOfContent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "curriculum_id"
    t.string   "curriculum_type"
  end

  add_index "items", ["curriculum_id", "curriculum_type"], name: "index_items_on_curriculum_id_and_curriculum_type"

  create_table "questions", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.boolean  "pupil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wikis", force: true do |t|
    t.string   "title"
    t.text     "article"
    t.integer  "clicks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
