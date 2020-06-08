class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
