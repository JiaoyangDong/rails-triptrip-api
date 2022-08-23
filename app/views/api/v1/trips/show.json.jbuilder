json.trip do
  json.partial! 'api/v1/trips/trip', { trip: @trip }
end
# json.my_booking @my_booking

json.is_booker @is_booker
json.is_saved @is_saved
json.bookmark_id @bookmark_id
json.booking_id @booking_id
json.has_survey @has_survey
