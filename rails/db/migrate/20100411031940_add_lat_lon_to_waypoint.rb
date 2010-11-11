class AddLatLonToWaypoint < ActiveRecord::Migration
  def self.up
    change_table :waypoints do |t|
      t.string :latitude
      t.string :longitude
    end
  end

  def self.down
    change_table :waypoints do |t|
      t.drop_column :latitude
      t.drop_collumn :longitude
    end
  end
end
