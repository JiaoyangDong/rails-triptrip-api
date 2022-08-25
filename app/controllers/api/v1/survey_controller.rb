class Api::V1::SurveyController < Api::V1::BaseController
  def create
    p "from survey create ==========================="
    trip = Trip.find(params[:trip_id])
    # reset all survey questions
    trip.questions.destroy_all
    # create question
    params[:questions].each do |q|
      question = Question.new(content: q[:content], question_type: q[:question_type])
      question.trip = trip
      question.save
      # create options
      q[:options].each do |option|
        Option.create(name: option, question_id: question.id)
      end
    end
    render json: { msg: "questions and options created" }, status: :created
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @questions = @trip.questions
  end

  def answer
    booking = Booking.find(params[:booking_id])
    params[:quesitons].each do |q|
      question = Qustion.find(q[:id])
      Answer.create(content: q[:answer], question_id: question.id, booking_id: booking.id)
    end
    render json: { msg: "answers created" }, status: :created
  end

  def stats
    @trip = Trip.find(params[:trip_id])

    all_tags = Tag.all
    @trip_tags = []
    all_tags.each do |tag|
      tag.active = true unless @trip.tags.find_by(id: tag.id).nil?
      @trip_tags << tag
    end
  end

  private

  def question_params(params)
    params.permit(:content, :question_type)
  end
end
