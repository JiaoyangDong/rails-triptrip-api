# json.trip_id @trip.id
json.question
json.array! @questions do |question|
  json.content question.content
  json.question_type question.question_type
  option_array = question.options.map { |option| option.name }
  json.options option_array
end
