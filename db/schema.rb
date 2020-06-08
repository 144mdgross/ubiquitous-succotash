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

ActiveRecord::Schema.define(version: 2020_06_08_035802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.string "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "version_id"
    t.string "content", null: false
    t.index ["version_id"], name: "index_lessons_on_version_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "lesson_id"
    t.string "question", null: false
    t.string "correct_answer"
    t.string "uid", null: false
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
  end

  create_table "version_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "version_id"
    t.index ["user_id"], name: "index_version_users_on_user_id"
    t.index ["version_id"], name: "index_version_users_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.bigint "subject_id"
    t.index ["subject_id"], name: "index_versions_on_subject_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "lessons", "versions"
  add_foreign_key "questions", "lessons"
  add_foreign_key "version_users", "users"
  add_foreign_key "version_users", "versions"
  add_foreign_key "versions", "subjects"
end
