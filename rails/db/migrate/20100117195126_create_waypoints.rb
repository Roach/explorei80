class CreateWaypoints < ActiveRecord::Migration
  def self.up
    create_table :waypoints do |t|
      t.string :name
      t.string :title
      t.string :id
      t.string :location
      t.text :description
      t.string :photos
      t.string :icon

      t.timestamps
    end
  end

  def self.down
    drop_table :waypoints
  end
end
