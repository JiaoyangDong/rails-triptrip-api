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
end
