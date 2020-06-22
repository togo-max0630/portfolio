# frozen_string_literal: true

class SubCategory < ApplicationRecord
  has_many :posts

  validates :name, presence: true
end
