# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :questions, [QuestionType], null: false

    def questions
      RatingQuestion.all
    end

    field :survey, SurveyType, null: false do
      argument :id, ID, required: true
    end

    def survey(id:)
      Survey.find(id: id)
    end

    field :surveys, [SurveyType], null: false

    def surveys
      Survey.all
    end

    field :user, UserType, null: false

    def user
      context[:current_user]
    end

  end
end
