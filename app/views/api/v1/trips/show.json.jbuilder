json.trip do
  json.partial! 'api/v1/trips/trip', { trip: @trip }
  json.partial! 'api/v1/trips/tags', { tags: @trip_tags}
end
# json.my_booking @my_booking

json.is_booker @is_booker
json.is_saved @is_saved
json.bookmark_id @bookmark_id
json.booking_id @booking_id
json.has_survey @has_survey
json.has_answers @has_answers
json.trip_host @trip_host
