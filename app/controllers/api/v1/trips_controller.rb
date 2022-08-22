class Api::V1::TripsController < Api::V1::BaseController

  def index
    taginfo = params[:tag]
    if taginfo.nil?
      @trips = Trip.all
    else
      @trips = Trip.joins(:tags).where(tags: { name: taginfo })
    end
    # render json: @trips
  end

  def show
    @trip = Trip.find(params[:id])
    @is_booker = @trip.bookings.find_by(user: @current_user).nil? ? false : true
    @is_saved = @trip.bookmarks.find_by(user: @current_user).nil? ? false : true
    @bookmark_id = @trip.bookmarks.find_by(user: @current_user).id unless @trip.bookmarks.find_by(user: @current_user).nil?
    # render json: {trip: @trip, is_booker: is_booker, is_saved: is_saved, bookmark_id: bookmark_id}
  end

  def create
    p "====== params ======"
    p params

    clean_tags = []
    # debugger
    params[:trip][:tags].each do |tag|
      if tag[:active] == true
        p tag[:name]
        clean_tags << tag[:name]
        # @trip.tags << Tag.find_by(name: tag)
      end
    end

    @trip = Trip.new(trip_params)
    @trip.user = @current_user
    clean_tags.each do |tag|
      @trip.tags << Tag.find_by(name: tag)
    end

    unless @trip.save
      render_error
    end
  end

  def upload
    @trip =Trip.find(params[:id])
    puts "params #{params}"
    @trip.image.attach(params[:image])
    render json: {msg: 'success'}
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :address, :longitude, :latitude, :image, :start_date, :end_date, :description, :status, :capacity, :tags)
  end

  def render_error
    render json: { errors: @trip.errors.full_messages }, status: :unprocessable_entity
  end

end
