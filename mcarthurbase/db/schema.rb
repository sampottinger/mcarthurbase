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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120122020315) do

  create_table "groups", :force => true do |t|
    t.integer  "language_id"
    t.integer  "section"
    t.string   "name"
    t.string   "footnote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["language_id"], :name => "index_groups_on_language_id"

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabularies", :force => true do |t|
    t.integer  "subject_id"
    t.string   "study"
    t.date     "session_date"
    t.integer  "language_id"
    t.integer  "session_num"
    t.string   "mcdi_type"
    t.integer  "percentile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vocabularies", ["language_id"], :name => "index_vocabularies_on_language_id"
  add_index "vocabularies", ["subject_id"], :name => "index_vocabularies_on_subject_id"

  create_table "vocabulary_words", :force => true do |t|
    t.integer  "vocabulary_id"
    t.integer  "word_id"
    t.boolean  "known"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vocabulary_words", ["vocabulary_id"], :name => "index_vocabulary_words_on_vocabulary_id"
  add_index "vocabulary_words", ["word_id"], :name => "index_vocabulary_words_on_word_id"

  create_table "words", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["group_id"], :name => "index_words_on_group_id"

end
