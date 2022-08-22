json.extract! trip, :id, :title, :location, :address, :longitude, :latitude, :start_date, :end_date, :description, :user_id, :status, :capacity
json.image trip.image.url
json.duration (trip.end_date - trip.start_date).to_i + 1
if trip.start_date.year == Date.today.year
  json.start_date trip.start_date&.strftime('%a, %b %d')
  json.end_date trip.end_date&.strftime('%a, %b %d')
else
  json.start_date trip.start_date&.strftime('%a, %b %d %Y')
  json.end_date trip.end_date&.strftime('%a, %b %d %Y')
end

tag_array = trip.tags.map { |tag| tag.name }
# tag_array = trip.tags.map { |tag| { name: tag.name,show: tag.show } }
json.tags tag_array
