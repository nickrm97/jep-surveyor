class Account
  include Mongoid::Document
  field :name, type: String

  # Relationships
  has_many :surveys
  has_many :users
end
