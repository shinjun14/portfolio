class Hobby < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy #1対n（コメント）

  attachment :image

end
