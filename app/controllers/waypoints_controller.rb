class WaypointsController < ApplicationController
  # GET /waypoints
  # GET /waypoints.xml

  def index
    @waypoints = Waypoint.all
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([38.11, -98.26], 4)

    @waypoints.each_with_index do |waypoint, index|
      @this_address = waypoint.location
      @this_title = waypoint.title
      @this_description = waypoint.description
      @this_id = waypoint.id

      results = Geocoding::get("#{@this_address}")
      if results.status == Geocoding::GEO_SUCCESS
        @coord = results[0].latlon
        @coordlat, @coordlon = results[0].latlon
        @marker = GMarker.new(@coord,:info_window => "<b>#{@this_id}</b><br />#{@this_description}")
        @map.declare_init(@marker, "marker_var_name")
        @map.event_init(@marker, :click, "function(){panmap(#{@coordlat},#{@coordlon},#{@this_id});}")
        @map.overlay_init(@marker)
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @waypoints }
      format.json  { render :json => @waypoints }
    end
  end

  # GET /waypoints/1
  # GET /waypoints/1.xml
  def show
    @waypoint = Waypoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @waypoint }
      format.json { render :json => @waypoint }
    end
  end

  # GET /waypoints/new
  # GET /waypoints/new.xml
  def new
    @waypoint = Waypoint.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @waypoint }
      format.json { render :json => @waypoint }
    end
  end

  # GET /waypoints/1/edit
  def edit
    @waypoint = Waypoint.find(params[:id])
  end

  # POST /waypoints
  # POST /waypoints.xml
  def create
    @waypoint = Waypoint.new(params[:waypoint])

    respond_to do |format|
      if @waypoint.save
        flash[:notice] = 'Waypoint was successfully created.'
        format.html { redirect_to(@waypoint) }
        format.xml  { render  :xml => @waypoint, :status => :created,
                              :location => @waypoint }
      else
        format.html { render  :action => "new" }
        format.xml  { render  :xml => @waypoint.errors,
                              :status => :unprocessable_entity }
      end
    end
  end

  # PUT /waypoints/1
  # PUT /waypoints/1.xml
  def update
    @waypoint = Waypoint.find(params[:id])

    respond_to do |format|
      if @waypoint.update_attributes(params[:waypoint])
        flash[:notice] = 'Waypoint was successfully updated.'
        format.html { redirect_to(@waypoint) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @waypoint.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /waypoints/1
  # DELETE /waypoints/1.xml
  def destroy
    @waypoint = Waypoint.find(params[:id])
    @waypoint.destroy

    respond_to do |format|
      format.html { redirect_to(waypoints_url) }
      format.xml  { head :ok }
    end
  end

  def add
    @map = Variable.new("map")
  end

end
