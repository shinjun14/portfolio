class Favorite < ApplicationRecord

  belongs_to :user #1対多
  belongs_to :hobby #１対多

  validates_uniqueness_of :hobby_id, scope: :user_id

end
