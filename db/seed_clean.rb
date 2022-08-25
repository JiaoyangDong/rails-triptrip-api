# trips = Trip.last(23)
trips = Trip.last(23)

trips.each do |trip|
  TripTag.where(trip: trip).destroy_all
  Booking.where(trip: trip).destroy_all
  Bookmark.where(trip: trip).destroy_all

  questions = Question.where(trip: trip)
  questions.each do |q|
    Option.where(question: q).destroy_all
    Answer.where(question: q).destroy_all
    q.destroy
  end
  trip.destroy
end
