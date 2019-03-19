class RatingQuestionsController < ApplicationController
  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    @rating_question = RatingQuestion.new(question_params)
    if @rating_question.save
      # flash[:notice] = "Your question has been created."
      redirect_to "/", notice: "Your question has been created."
    end
  end

  def edit
    @rating_question = RatingQuestion.find(params[:id])
  end

  def show
    @rating_question = RatingQuestion.find(params[:id])
  end

  private

  def question_params
    params.require(:rating_question).permit(:title)
  end
end
