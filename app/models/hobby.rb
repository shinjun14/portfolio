class Hobby < ApplicationRecord

  belongs_to :user

  attachment :image

end
