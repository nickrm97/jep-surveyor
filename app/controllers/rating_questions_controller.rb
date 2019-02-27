class RatingQuestionsController < ApplicationController
  def index
    @rating_questions = RatingQuestion.all
  end

  def create
    @rating_question = RatingQuestion.new(question_params)

    if @rating_question.save 
      send_response(201, serialize(@rating_question))      
    else 
      send_response(422, { 'errors' => @rating_question.errors.messages })
    end
  end

  def send_response(status, body)
    render json: body, status: status
  end

  def serialize(question)
    {
      id: question.id.to_s,
      title: question.title, 
      tag: question.tag
    }
  end

  def question_params
    params.require(:rating_question).permit(:title, :tag)
  end
end
