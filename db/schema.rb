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

ActiveRecord::Schema.define(:version => 20100411031940) do

  create_table "attachments", :force => true do |t|
    t.string   "filename"
    t.integer  "size"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
  end

  create_table "events", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "waypoints", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.string   "photos"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude"
    t.string   "longitude"
  end

end
