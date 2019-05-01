# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :questions, [QuestionType], null: false

    field :survey, SurveyType, null: false do
      argument :id, ID, required: true
    end

    field :surveys, [SurveyType], null: false

    def questions
      RatingQuestion.all
    end

    def survey(id:)
      Survey.find(id: id)
    end

    def surveys
      Survey.all
    end
  end
end
