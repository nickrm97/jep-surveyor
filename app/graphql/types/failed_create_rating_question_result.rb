# frozen_string_literal: true

module Types
  class FailedCreateRatingQuestionResult < Types::BaseObject
    field :errors, [String], null: false

    def errors
      object.errors.full_messages
    end
  end
end
