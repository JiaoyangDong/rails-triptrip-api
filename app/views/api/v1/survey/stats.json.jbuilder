json.questions @trip.questions do |question|
  json.id quesiton.id
  json.content quesiton.content
  json.answers question.answers do |answer|
    json.booking_id answer.booking_id
    json.content answer.content
  end
end
