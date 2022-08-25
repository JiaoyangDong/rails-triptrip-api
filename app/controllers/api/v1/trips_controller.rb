class Api::V1::TripsController < Api::V1::BaseController

  def index
    taginfo = params[:tag]
    if taginfo.empty?
      @trips = Trip.all.where('end_date >= CURRENT_DATE')
    else
      @trips = Trip.joins(:tags).where(tags: { name: taginfo }).where('end_date >= CURRENT_DATE')
    end
    # render json: @trips
  end

  def show
    @trip = Trip.find(params[:id])
    @is_booker = @trip.bookings.find_by(user: @current_user).nil? ? false : true
    @is_saved = @trip.bookmarks.find_by(user: @current_user).nil? ? false : true
    @bookmark_id = @trip.bookmarks.find_by(user: @current_user).id unless @trip.bookmarks.find_by(user: @current_user).nil?
    @booking_id = @trip.bookings.find_by(user: @current_user).id unless @trip.bookings.find_by(user: @current_user).nil?
    @has_survey = !@trip.questions.empty?
    # render json: {trip: @trip, is_booker: is_booker, is_saved: is_saved, bookmark_id: bookmark_id}
    all_tags = Tag.all
    @trip_tags = []
    all_tags.each do |tag|
      tag.active = true unless @trip.tags.find_by(id: tag.id).nil?
      @trip_tags << tag
    end



  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = @current_user
    params[:tags][:tags].each do |tag|
      tag_to_add = Tag.find(tag)
      @trip.tags << tag_to_add
    end

    unless @trip.save
      render_error
    end
  end

  # def edit
  #   @trip = Trip.find(params[:id])
  #   render json: @trip
  # end

  def update
    @trip = Trip.find(params[:id])

    @trip.tags = []
    params[:tags][:tags].each do |tag|
      tag_to_add = Tag.find(tag)
      @trip.tags << tag_to_add
    end

    if @trip.update(trip_params)
      # render json: @trip
      # render :show
      render json: { msg: 'Updated!' }

    else
      render_error
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    render json: { msg: 'Deleted' }
  end

  def upload
    @trip = Trip.find(params[:id])
    puts "params #{params}"
    @trip.image.attach(params[:image])
    render json: {msg: 'Image upload success!'}
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :address, :longitude, :latitude, :image, :start_date, :end_date, :description, :status, :capacity)
  end

  def render_error
    render json: { errors: @trip.errors.full_messages }, status: :unprocessable_entity
  end

end
