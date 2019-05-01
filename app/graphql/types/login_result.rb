# frozen_string_literal: true

module Types
  class LoginResult < BaseUnion
    possible_types SuccessfulLoginResult, FailedLoginResult

    def self.resolve_type(object, _context)
      if object.persisted?
        SuccessfulLoginResult
      else
        FailedLoginResult
      end
    end
  end
end
