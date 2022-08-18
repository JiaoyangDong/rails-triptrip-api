# json.trips do
json.array! @trips do |trip|
  json.partial! 'api/v1/trips/trip', { trip: trip }
end
# end
