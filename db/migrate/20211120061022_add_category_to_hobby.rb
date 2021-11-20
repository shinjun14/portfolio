class AddCategoryToHobby < ActiveRecord::Migration[5.2]
  def change
    add_column :hobbies, :category, :string
  end
end
