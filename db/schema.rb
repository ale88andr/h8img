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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130422170036) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "body"
    t.integer  "views",       :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "articles", ["category_id"], :name => "index_articles_on_category_id"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories", ["title"], :name => "index_categories_on_title", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "user_id"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["article_id"], :name => "index_comments_on_article_id"

  create_table "galleries", :force => true do |t|
    t.string   "image"
    t.integer  "album_id_id"
    t.integer  "user_id_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "galleries", ["album_id_id"], :name => "index_galleries_on_album_id_id"
  add_index "galleries", ["user_id_id"], :name => "index_galleries_on_user_id_id"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "qms", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.integer  "recipient"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "qms", ["user_id"], :name => "index_qms_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "show_email"
    t.date     "user_burn"
    t.string   "user_country"
    t.integer  "user_sex"
    t.text     "user_about"
    t.string   "user_avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
