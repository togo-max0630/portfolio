class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  #そのユーザーが持っているLikeモデルを探す
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  is_impressionable counter_cache: true
  
  validates :category_id, :sub_category_id, :title, :body, presence: true
end
