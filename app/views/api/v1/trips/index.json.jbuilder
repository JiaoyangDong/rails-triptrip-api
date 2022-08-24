# json.trips do
json.array! @trips.order('created_at DESC') do |trip|
  json.partial! 'api/v1/trips/trip', { trip: trip }
end
# end
