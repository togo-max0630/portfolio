class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  attachment :profile_image, destroy: false
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :follower, class_name: "Rerationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Rerationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed #自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower #自分をフォローしている人

  def follow(user_id)
     follower.create(followed_id: user_id)
  end
  def unfollow(user_id)
     follower.find_by(followed_id: user_id).destroy
  end
  # フォローしているユーザーに自信が含まれていないか確認
  def following?(user)
     following_user.include?(user)
  end

  
  # フォロー機能(foregin_key = 入口 source= 出口)
  # has_many :rerationships
  # has_many :followings, through: :rerationships, source: :follow
  # has_many :reverse_of_rerationships, class_name: 'Rerationship', foreign_key: 'follow_id'
  # has_many :followers, through: :rerationships, source: :user
  
  # フォローするユーザーが自身でないか
  # def follow(other_user)
  #   unless self == other_user 
  #     self.rerationships.find_or_create_by(follow_id: other_user.id)
  #   end
  # end

  # def unfollow(other_user)
  #   rerationship == self.rerationships.find_by(follow_id: other_user.id)
  #   rerationship.destroy if rerationship
  # end

  # # フォローしているユーザーに自信が含まれていないか確認
  # def following?(other_user)
  #   self.followings.include?(other_user)
  # end

  has_many :group_users
  has_many :groups, through: :group_users
  
  validates :name, :nickname, :residence, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }



end
