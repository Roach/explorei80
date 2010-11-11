class HomeController < ApplicationController

  def index
    @posts = Waypoint.find(:all)

    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([39.11, -98.26], 4)
    @map.overlay_init(GMarker.new("450 Marsh, Reno NV", :title => "geocoded",
                                  :info_window => "I have been placed through RJS"))

    respond_to do |format|
      format.html
      format.xml  { render :xml => @waypoints }
    end
  end

  def update
     @map = Variable.new("map")
     @marker = GMarker.new([75.89, -42.767], :title => "Update",
                           :info_window => "I have been placed through RJS")
  end

end
