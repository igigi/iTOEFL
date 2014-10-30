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

ActiveRecord::Schema.define(version: 20141029095545) do

  create_table "add_questions", force: true do |t|
    t.string   "content"
    t.integer  "mark_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "add_questions", ["mark_id"], name: "index_add_questions_on_mark_id", using: :btree
  add_index "add_questions", ["user_id"], name: "index_add_questions_on_user_id", using: :btree

  create_table "article_marks", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.string   "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_marks", ["article_id"], name: "index_article_marks_on_article_id", using: :btree
  add_index "article_marks", ["user_id"], name: "index_article_marks_on_user_id", using: :btree

  create_table "articles", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "broadcast_sets", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subscribe_count", default: 0
  end

  create_table "discussions", force: true do |t|
    t.string   "content"
    t.string   "media_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "media_type"
    t.string   "media_length"
    t.integer  "favorite_count"
    t.integer  "reply_count"
  end

  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id", using: :btree

  create_table "grammar_groups", force: true do |t|
    t.string   "sequence_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grammar_type_id"
  end

  add_index "grammar_groups", ["grammar_type_id"], name: "index_grammar_groups_on_grammar_type_id", using: :btree

  create_table "grammar_questions", force: true do |t|
    t.string   "sequence_number"
    t.text     "content"
    t.integer  "grammar_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grammar_questions", ["grammar_group_id"], name: "index_grammar_questions_on_grammar_group_id", using: :btree

  create_table "grammar_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "judgements", force: true do |t|
    t.integer  "score"
    t.integer  "mark_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "judgements", ["mark_id"], name: "index_judgements_on_mark_id", using: :btree
  add_index "judgements", ["user_id"], name: "index_judgements_on_user_id", using: :btree

  create_table "lb_comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "live_broadcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lb_comments", ["live_broadcast_id"], name: "index_lb_comments_on_live_broadcast_id", using: :btree
  add_index "lb_comments", ["user_id"], name: "index_lb_comments_on_user_id", using: :btree

  create_table "live_broadcasts", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.text     "summary"
    t.string   "video_url"
    t.datetime "start_at"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "teacher"
    t.datetime "end_at"
  end

  create_table "mark_tips", force: true do |t|
    t.integer  "start_index"
    t.integer  "end_index"
    t.string   "audio_url"
    t.integer  "article_mark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mark_tips", ["article_mark_id"], name: "index_mark_tips_on_article_mark_id", using: :btree

  create_table "marks", force: true do |t|
    t.string   "content"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  add_index "marks", ["task_id"], name: "index_marks_on_task_id", using: :btree
  add_index "marks", ["user_id"], name: "index_marks_on_user_id", using: :btree

  create_table "opinions", force: true do |t|
    t.string   "content"
    t.string   "media_url"
    t.integer  "seat"
    t.integer  "replied_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "media_type"
    t.string   "media_length"
    t.string   "status"
    t.integer  "favorite_count"
    t.string   "replied_type"
  end

  add_index "opinions", ["owner_id"], name: "index_opinions_on_owner_id", using: :btree
  add_index "opinions", ["replied_id"], name: "index_opinions_on_replied_id", using: :btree
  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id", using: :btree

  create_table "oral_groups", force: true do |t|
    t.string   "sequence_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "oral_questions", force: true do |t|
    t.string   "sequence_number"
    t.string   "data_url"
    t.text     "original_text"
    t.integer  "oral_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oral_questions", ["oral_group_id"], name: "index_oral_questions_on_oral_group_id", using: :btree

  create_table "oral_results", force: true do |t|
    t.integer  "user_id"
    t.integer  "oral_group_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oral_results", ["user_id"], name: "index_oral_results_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "content"
    t.string   "tip"
    t.string   "related_resource"
    t.string   "subject"
    t.string   "source"
    t.string   "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "set"
    t.string   "number"
  end

  create_table "rb_comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "recorded_broadcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rb_comments", ["recorded_broadcast_id"], name: "index_rb_comments_on_recorded_broadcast_id", using: :btree
  add_index "rb_comments", ["user_id"], name: "index_rb_comments_on_user_id", using: :btree

  create_table "rb_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "recorded_broadcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rb_favorites", ["recorded_broadcast_id"], name: "index_rb_favorites_on_recorded_broadcast_id", using: :btree
  add_index "rb_favorites", ["user_id"], name: "index_rb_favorites_on_user_id", using: :btree

  create_table "recorded_broadcasts", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.text     "summary"
    t.string   "video_url"
    t.integer  "broadcast_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rb_favorites_count", default: 0
    t.integer  "play_count",         default: 0
    t.integer  "subscribe_count",    default: 0
  end

  add_index "recorded_broadcasts", ["broadcast_set_id"], name: "index_recorded_broadcasts_on_broadcast_set_id", using: :btree

  create_table "reports", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "is_correct"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
    t.boolean  "share"
    t.string   "status",      default: "0"
  end

  add_index "tasks", ["question_id"], name: "index_tasks_on_question_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "origin"
    t.string   "open_id"
    t.string   "password"
    t.string   "auth_token"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "captcha"
  end

  create_table "vocabulary_groups", force: true do |t|
    t.string   "sequence_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabulary_questions", force: true do |t|
    t.string   "sequence_number"
    t.text     "content"
    t.integer  "vocabulary_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "word"
  end

  add_index "vocabulary_questions", ["vocabulary_group_id"], name: "index_vocabulary_questions_on_vocabulary_group_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  create_table "works", force: true do |t|
    t.string   "standpoint"
    t.string   "content"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["question_id"], name: "index_works_on_question_id", using: :btree
  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

end
