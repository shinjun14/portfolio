class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :hobby_id
      t.integer :user_id
      t.string :comment
      t.float :rate

      t.timestamps
    end
  end
end
