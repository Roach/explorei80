class Waypoint < ActiveRecord::Base

  validates_presence_of :name

  before_save :lookup_lat_lon

  def lookup_lat_lon
    results = Geocoding::get(location)
    if results.status == Geocoding::GEO_SUCCESS
      lat, lon = results[0].latlon
      self.latitude = lat if latitude.blank?
      self.longitude = lon if longitude.blank?
    end
  end

  def as_json(options = {})
    {
      :id => id,
      :name => name,
      :title => title,
      :location => location,
      :description => description,
      :photos => photos,
      :icon => string,
      :created_at => created_at,
      :updated_at => updated_at,
      :latitude => latitude,
      :longitude => longitude
    }
  end

end
