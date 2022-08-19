json.upcoming @upcoming do |trip|
  json.partial! 'api/v1/trips/trip', { trip: trip }
  json.attendees trip.attendees do |attendee|
    json.partial! 'api/v1/users/user', { user: attendee }
  end
end

json.past @past do |trip|
  json.partial! 'api/v1/trips/trip', { trip: trip }
  json.attendees trip.attendees do |attendee|
    json.partial! 'api/v1/users/user', { user: attendee }
  end
end
