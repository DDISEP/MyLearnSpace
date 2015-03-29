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

ActiveRecord::Schema.define(version: 20150329170104) do

  create_table "answers", force: true do |t|
    t.string   "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
  end

  create_table "assessment_contents", force: true do |t|
    t.integer  "assessment_id"
    t.integer  "knowledge_element_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assessment_contents", ["assessment_id"], name: "index_assessment_contents_on_assessment_id"
  add_index "assessment_contents", ["knowledge_element_id"], name: "index_assessment_contents_on_knowledge_element_id"

  create_table "assessments", force: true do |t|
    t.string   "creation_date"
    t.string   "datetime"
    t.string   "title"
    t.string   "description",        limit: 1000
    t.integer  "min_points_1"
    t.integer  "min_points_2"
    t.integer  "min_points_3"
    t.integer  "min_points_4"
    t.integer  "min_points_5"
    t.integer  "user_id"
    t.integer  "assessment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "assessments", ["assessment_id"], name: "index_assessments_on_assessment_id"
  add_index "assessments", ["user_id"], name: "index_assessments_on_user_id"

  create_table "comments", force: true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["exercise_id"], name: "index_comments_on_exercise_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

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

  create_table "exercise_answers", force: true do |t|
    t.text     "answer"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_contents", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "knowledge_element_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercise_contents", ["exercise_id"], name: "index_exercise_contents_on_exercise_id"
  add_index "exercise_contents", ["knowledge_element_id"], name: "index_exercise_contents_on_knowledge_element_id"

  create_table "exercises", force: true do |t|
    t.string   "title"
    t.string   "description",        limit: 1000
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "knmessages", force: true do |t|
    t.integer  "knowledge_element_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledge_elements", force: true do |t|
    t.string   "tag"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledge_elements_learning_units", force: true do |t|
    t.integer "knowledge_element_id"
    t.integer "learning_unit_id"
  end

  create_table "learning_units", force: true do |t|
    t.string   "title"
    t.integer  "hours"
    t.string   "descriptionOfKnowledgeElement"
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
    t.integer  "max_points"
    t.integer  "achieved_points"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.integer  "assessment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_position"
  end

  add_index "performances", ["assessment_id"], name: "index_performances_on_assessment_id"
  add_index "performances", ["exercise_id"], name: "index_performances_on_exercise_id"
  add_index "performances", ["user_id"], name: "index_performances_on_user_id"

  create_table "questions", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
  end

  create_table "subassessments", force: true do |t|
    t.integer  "position"
    t.string   "text"
    t.string   "solution"
    t.integer  "points"
    t.integer  "assessment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subassessments", ["assessment_id"], name: "index_subassessments_on_assessment_id"

  create_table "subexercises", force: true do |t|
    t.integer  "position"
    t.string   "text"
    t.string   "solution"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
  end

  add_index "subexercises", ["exercise_id"], name: "index_subexercises_on_exercise_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.boolean  "learner"
    t.boolean  "admin"
    t.boolean  "teacher"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_tags", force: true do |t|
    t.integer  "wiki_id"
    t.integer  "knowledge_element_id"
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
