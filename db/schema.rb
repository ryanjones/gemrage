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

ActiveRecord::Schema.define(:version => 20101017032202) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "installed_gems", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "rubygem_id",   :null => false
    t.integer  "machine_id",   :null => false
    t.integer  "platform_id",  :null => false
    t.text     "version_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installed_gems", ["machine_id"], :name => "index_installed_gems_on_machine_id"
  add_index "installed_gems", ["platform_id"], :name => "index_installed_gems_on_platform_id"
  add_index "installed_gems", ["rubygem_id"], :name => "index_installed_gems_on_rubygem_id"
  add_index "installed_gems", ["user_id"], :name => "index_installed_gems_on_user_id"

  create_table "machines", :force => true do |t|
    t.integer "user_id",    :null => false
    t.string  "identifier", :null => false
  end

  add_index "machines", ["user_id", "identifier"], :name => "index_machines_on_user_id_and_identifier", :unique => true

  create_table "payloads", :force => true do |t|
    t.string   "uid"
    t.string   "machine_id"
    t.text     "payload"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payloads", ["uid"], :name => "index_payloads_on_uid", :unique => true

  create_table "platforms", :force => true do |t|
    t.string "code", :limit => 20, :null => false
    t.string "name", :limit => 20, :null => false
  end

  add_index "platforms", ["code"], :name => "index_platforms_on_code", :unique => true

  create_table "rubygems", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "latest_version"
    t.text     "info"
    t.integer  "downloads",      :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "queue",          :default => false, :null => false
  end

  add_index "rubygems", ["name"], :name => "index_rubygems_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "handle"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
