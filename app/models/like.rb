# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count
end
