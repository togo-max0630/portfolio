class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  attachment :profile_image, destroy: false
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # フォロー機能(foregin_key = 入口 source= 出口)
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :relationships, source: :user

  # フォローするユーザーが自身でないか
  def follow(other_user)
    unless self == other_user 
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship == self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  # フォローしているユーザーに自信が含まれていないか確認
  def following?(other_user)
    self.followings.include?(other_user)
  end

end
