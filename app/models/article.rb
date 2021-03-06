# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 } # Validation lives in the model of Article
end
