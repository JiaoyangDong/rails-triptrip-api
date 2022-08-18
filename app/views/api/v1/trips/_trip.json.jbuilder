json.extract! trip, :id, :title, :location, :image, :start_date, :end_date, :description, :user_id, :status, :capacity
json.duration (trip.end_date - trip.start_date).to_i + 1
json.start_date trip.start_date&.strftime('%a, %b %d')

tag_array = trip.tags.map { |tag| tag.name }
json.tags tag_array
