# frozen_string_literal: true

module Types
  class CreateRatingQuestionResult < BaseUnion
    possible_types QuestionType, FailedCreateRatingQuestionResult

    def self.resolve_type(object, _context)
      if object.persisted?
        p '...hello there'
        QuestionType
      else
        FailedCreateRatingQuestionResult
      end
    end
  end
end
