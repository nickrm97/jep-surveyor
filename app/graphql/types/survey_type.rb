# frozen_string_literal: true

module Types
  class SurveyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :rating_questions, [QuestionType], null: false
  end
end
