class AddScoreToHobby < ActiveRecord::Migration[5.2]
  def change
    add_column :hobbies, :score, :decimal, precision: 5, scale: 3
  end
end
