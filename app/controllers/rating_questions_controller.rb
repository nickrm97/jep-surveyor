class RatingQuestionsController < ApplicationController
  before_action :find_question, only: [:show, :update, :destroy]

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

  def destroy
    @rating_question.destroy
    # send_response(204, nil) if @rating_question.destroy
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

  def find_question
    @rating_question = RatingQuestion.find(params["id"])
    unless @rating_question
      head 404
      return
    end  
  end
end
