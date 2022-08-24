json.upcoming @upcoming.order('start_date ASC') do |trip|
  json.partial! 'api/v1/trips/trip', { trip: trip }
  # json.attendees trip.attendees do |attendee|
  #   json.partial! 'api/v1/users/user', { user: attendee }
  # end
end

json.past @past.order('end_date DESC') do |trip|
  json.partial! 'api/v1/trips/trip', { trip: trip }
  # json.attendees trip.attendees do |attendee|
  #   json.partial! 'api/v1/users/user', { user: attendee }
  # end
end

json.bookmarks @bookmarks.order('created_at DESC') do |trip|
  json.partial! 'api/v1/trips/trip', { trip: trip }
  # json.attendees trip.attendees do |attendee|
  #   json.partial! 'api/v1/users/user', { user: attendee }
  # end
end
