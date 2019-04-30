# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :questions, [QuestionType], null: false

    def questions
      RatingQuestion.all
    end
  end
end
