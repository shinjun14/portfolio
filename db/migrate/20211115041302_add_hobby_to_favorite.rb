class AddHobbyToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :hobby, foreign_key: true
  end
end
