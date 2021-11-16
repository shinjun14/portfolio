class Hobby < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy #1対n（コメント）

  #お気に入り機能（ブックマーク）
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  attachment :image

  def self.search_for(content, method)
    if method == 'perfect'
      Hobby.where(title: content)
    elsif method == 'forward'
      Hobby.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Hobby.where('name LIKE ?', '%'+content)
    else
      Hobby.where('name LIKE ?', '%'+content+'%')
    end
  end

end
