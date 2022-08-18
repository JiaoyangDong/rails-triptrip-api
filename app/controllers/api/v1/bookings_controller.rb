class Api::V1::BookingsController <  Api::V1::BaseController
  def create
    @booking = Booking.new(trip: Trip.find(params[:trip_id]), user: @current_user)
    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end
end
