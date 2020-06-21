class User < ApplicationRecord
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

  enum category: {"メーカー": 0, "小売": 1, "サービス": 2, "ソフトウェア・通信": 3, "商社": 4, "金融": 5, "マスコミ": 6, "官公庁・公社・団体": 7}
  enum sub_category: {"営業": 0, "コンサルタント": 1, "事務": 2, "経理": 3, "人事": 4, "マーケティング": 5, "販売": 6, "飲食": 7, "エンジニア": 8, "看護師": 9, "ドライバー": 10, "工場": 11, "デザインー": 12}

  # 退会機能
  def active_for_authentication?
    super && (self.is_valid == false)
  end

end
