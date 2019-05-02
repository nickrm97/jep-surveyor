# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :questions, [QuestionType], null: false

    def questions
      context[:current_user].account.surveys.all.rating_questions
    end

    field :survey, SurveyType, null: false do
      argument :id, ID, required: true
    end

    def survey(id:)
      context[:current_user].account.surveys.find(id: id)
    end

    field :surveys, [SurveyType], null: false

    def surveys
      context[:current_user].account.surveys
    end

    field :user, UserType, null: false

    def user
      context[:current_user]
    end

  end
end
