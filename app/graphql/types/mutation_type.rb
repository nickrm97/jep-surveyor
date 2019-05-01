# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_question, CreateRatingQuestionResult, null: false do
      argument :title, String, required: true
    end

    field :update_question, CreateRatingQuestionResult, null: false do
      argument :title, String, required: true
      argument :id, ID, required: true
    end

    field :delete_question, QuestionType, null: false do
      argument :id, ID, required: true
    end

    def create_question(title:)
      RatingQuestion.create(title: title)
    end

    def update_question(id:, title:)
      result = RatingQuestion.find(id: id)
      result.update(title: title)
      result
    end

    def delete_question(id:)
      result = RatingQuestion.find(id: id)
      if result
        result.destroy
        result
      end
    end
  end
end
