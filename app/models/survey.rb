# frozen_string_literal: true

class Survey
  include Mongoid::Document
  field :name, type: String
  has_many :rating_questions
  validates :name, presence: true
end
