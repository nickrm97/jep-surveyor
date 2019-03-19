module RatingQuestionsHelper
  def rating_questions_props
    RatingQuestionsProps.new(@rating_questions).to_props
  end

  def rating_question_props
    RatingQuestionProps.new(@rating_question).to_props
  end
end
