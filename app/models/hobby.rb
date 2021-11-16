class Hobby < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy #1対n（コメント）

  #お気に入り機能（ブックマーク）
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  attachment :image

end
