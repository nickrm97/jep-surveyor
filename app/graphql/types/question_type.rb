# frozen_string_literal: true

module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :survey_id, ID, null: false
  end
end
