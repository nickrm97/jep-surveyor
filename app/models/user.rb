# frozen_string_literal: true

class User
  require 'jwt'
  include Mongoid::Document
  include ActiveModel::SecurePassword

  belongs_to :account
  field :email, type: String

  field :password_digest, type: String
  has_secure_password

  def token
    token = JWT.encode payload, private_key, 'HS256'
  end

  def payload
    {
      email: email,
      id: id
    }
  end

  def private_key
    'muybiengraciasytu'
  end
end
