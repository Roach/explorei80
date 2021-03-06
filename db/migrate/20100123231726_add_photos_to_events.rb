class AddPhotosToEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
    end
  end

  def self.down
    drop_table :events
  end
end
