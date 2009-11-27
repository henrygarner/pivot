# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091126233803) do

  create_table "axes", :force => true do |t|
    t.integer  "fact_id"
    t.integer  "dimension_id"
    t.string   "dimension_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_dimensions", :force => true do |t|
    t.string   "base"
    t.string   "connected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "date_dimensions", :force => true do |t|
    t.string   "day"
    t.string   "month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealer_channel_dimensions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dimensions", :force => true do |t|
    t.integer  "metric_id"
    t.string   "type"
    t.string   "grain"
    t.boolean  "additive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facts", :force => true do |t|
    t.integer  "metric_id"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_dimensions", :force => true do |t|
    t.string   "subscription"
    t.string   "tv"
    t.string   "replay"
    t.string   "kids"
    t.string   "music"
    t.string   "value_pack"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end