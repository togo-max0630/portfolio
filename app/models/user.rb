class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :groups
  attachment :profile_image, destroy: false
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy

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
  
  validates :name, :nickname, :residence, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

  # 退会機能
  def active_for_authentication?
    super && (self.is_valid == false)
  end

end
