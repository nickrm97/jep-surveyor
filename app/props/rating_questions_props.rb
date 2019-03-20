class RatingQuestionsProps
  attr_reader :rating_questions

  def initialize(rating_questions)
    @rating_questions = rating_questions
  end

  def to_props
    {
   
      end
    }
  end

  def random_number
    rand(100)
  end
end
