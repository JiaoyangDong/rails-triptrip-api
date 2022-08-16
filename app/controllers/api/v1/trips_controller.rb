class Api::V1::TripsController < Api::V1::BaseController
  def index
    if params["filter"].nil?
      @trips = Trip.all
    else
    end
    p @trips.length
    render json: @trips
  end

  def show
    @trip = Trip.find(params[:id])
    # @my_booking = @trip.bookings.find_by(user: @current_user)
    render json: @trip
    # render json: {pet: @pet, my_booking: @my_booking}
  end
end
