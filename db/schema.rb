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

ActiveRecord::Schema.define(version: 20160129115232) do

  create_table "answers", force: true do |t|
    t.string   "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
  end

  create_table "comments", force: true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["exercise_id"], name: "index_comments_on_exercise_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "contents", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents_items", force: true do |t|
    t.integer "content_id"
    t.integer "item_id"
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
    t.string   "hyperlink"
  end

  create_table "curriculums_users", force: true do |t|
    t.integer "curriculum_id"
    t.integer "user_id"
  end

  create_table "data_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fileName"
    t.string   "fileType"
  end

  create_table "exams", force: true do |t|
    t.integer  "maxPoints"
    t.integer  "minPoints"
    t.time     "maxTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_answers", force: true do |t|
    t.text     "answer"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_contents", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercise_contents", ["content_id"], name: "index_exercise_contents_on_content_id"
  add_index "exercise_contents", ["exercise_id"], name: "index_exercise_contents_on_exercise_id"

  create_table "exercises", force: true do |t|
    t.string   "title"
    t.string   "description", limit: 1000
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "moderated"
    t.boolean  "sequence"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "items", force: true do |t|
    t.string   "title"
    t.integer  "hours"
    t.string   "descriptionOfContent"
    t.integer  "curriculum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["exercise_id"], name: "index_likes_on_exercise_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "logins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performances", force: true do |t|
    t.integer  "achieved_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_position"
    t.integer  "user_id"
    t.integer  "exercise_id"
  end

  create_table "progresses", force: true do |t|
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
  end

  create_table "solutions", force: true do |t|
    t.string   "correct"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subexercises", force: true do |t|
    t.integer  "position"
    t.string   "text"
    t.string   "solution"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
    t.boolean  "moderated"
    t.boolean  "active"
    t.boolean  "examItem"
  end

  add_index "subexercises", ["exercise_id"], name: "index_subexercises_on_exercise_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.boolean  "pupil"
    t.boolean  "learner"
    t.boolean  "admin"
    t.boolean  "teacher"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_tags", force: true do |t|
    t.integer  "wiki_id"
    t.integer  "content_id"
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
