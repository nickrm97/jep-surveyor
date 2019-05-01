# frozen_string_literal: true

class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String

  field :password_digest, type: String
  has_secure_password

  validates :email, presence: true
end