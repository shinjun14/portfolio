class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hobbies, dependent: :destroy #1対n（投稿）

  has_many :comments, dependent: :destroy #1対n（コメント）

  attachment :profile_image
  attachment :image

end
