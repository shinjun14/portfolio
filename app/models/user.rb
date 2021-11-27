class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hobbies, dependent: :destroy #1対n（投稿）
  has_many :comments, dependent: :destroy #1対n（コメント）
  has_many :favorites, dependent: :destroy #1対nブックマーク機能

  has_many :likes, dependent: :destroy #いいね機能
  has_many :liked_hobbies, through: :likes, source: :hobby

  attachment :profile_image
  attachment :image

  #フォロー機能
  #フォローフォロワー関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # フォロー、フォロワー　一覧画面
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  validates :name, presence: { message: 'を入力してください。' }

end
