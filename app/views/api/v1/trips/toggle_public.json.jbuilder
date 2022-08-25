json.trip do
  json.partial! 'api/v1/trips/trip', { trip: @trip }
  # json.partial! 'api/v1/trips/tags', { tags: @trip_tags}
end
json.status @trip.public ? 'public' : 'private'
