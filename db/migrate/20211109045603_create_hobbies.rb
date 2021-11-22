class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name
      t.string :title
      t.text :introduction
      t.string :good_part
      t.string :bad_part
      t.float :rate
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
