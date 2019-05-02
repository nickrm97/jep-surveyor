# frozen_string_literal: true

module Types
  class FailedLoginResult < Types::BaseObject
    field :errors, String, null: false

    def errors
      'muy malo --- wrong password'
    end
  end
end
