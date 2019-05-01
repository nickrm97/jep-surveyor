# frozen_string_literal: true

module Types
  class SuccessfulLoginResult < Types::BaseObject
    field :email, String, null: false
  end
end
