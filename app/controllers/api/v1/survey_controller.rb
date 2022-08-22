class Api::V1::SurveyController < Api::V1::BaseController
  def create
    p "from survey create ==========================="
    trip = Trip.find(params[:trip_id])
    # reset all survey questions
    Trip.last.questions.destroy_all
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

  private

  def question_params(params)
    params.permit(:content, :question_type)
  end
end
