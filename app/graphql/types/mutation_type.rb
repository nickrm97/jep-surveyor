# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_question, CreateRatingQuestionResult, null: false do
      argument :title, String, required: true
      argument :survey_id, ID, required: true
    end

    def create_question(title:, survey_id:)
      survey = Survey.find(id: survey_id)
      question = survey.rating_questions.create(title: title)
      question
    end

    field :update_question, CreateRatingQuestionResult, null: false do
      argument :title, String, required: true
      argument :id, ID, required: true
    end

    def update_question(id:, title:)
      result = RatingQuestion.find(id: id)
      result.update(title: title)
      result
    end

    field :delete_question, QuestionType, null: false do
      argument :id, ID, required: true
    end

    def delete_question(id:)
      result = RatingQuestion.find(id: id)
      if result
        result.destroy
        result
      end
    end

    field :login, LoginResult, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      user = User.find_by(email: email)
      user.authenticate(password)
    end

    field :create_user, LoginResult, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def create_user(email:, password:)
      User.create(email: email, password: password)
    end

  end
end
