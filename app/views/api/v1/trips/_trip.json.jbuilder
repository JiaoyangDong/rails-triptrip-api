json.extract! trip, :id, :title, :location, :address, :start_date, :end_date, :description, :user_id, :status, :capacity
json.image trip.image.url
json.duration (trip.end_date - trip.start_date).to_i + 1

tag_array = trip.tags.map { |tag| tag.name }
json.tags tag_array
