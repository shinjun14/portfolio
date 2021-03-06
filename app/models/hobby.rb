class Hobby < ApplicationRecord

  has_many :tags, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy #1対n（コメント）

  #お気に入り機能（ブックマーク）
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  #いいね機能
  has_many :likes, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  attachment :image

  validates :title, presence:  { message: 'を入力してください。' }
  validates :introduction, presence: { message: 'を入力してください。' }

end
