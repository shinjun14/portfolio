class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.integer :genre_id
      t.integer :image_id
      t.string :name
      t.string :title
      t.text :introduction
      t.string :good_part
      t.string :bad_part
      t.float :rate

      t.timestamps
    end
  end
end
