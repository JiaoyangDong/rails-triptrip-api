json.questions @trip.questions do |question|
  json.id question.id
  json.content question.content
  json.answers question.answers do |answer|
    json.booking_id answer.booking_id
    json.content answer.content
  end

  # counts the number of answers for each question
  counts_tmp = {}
  question.answers.each do |answer|
    if counts_tmp[answer.content].nil?
      counts_tmp[answer.content] = 1
    else
      counts_tmp[answer.content] += 1
    end
  end
  #
  counts = []
  counts_tmp.each do |key, value|
    counts << { name: key, value: value }
  end
  json.clean_answers counts
end

json.attendees @trip.attendees do |attendee|
  json.partial! 'api/v1/users/user', { user: attendee }
end
