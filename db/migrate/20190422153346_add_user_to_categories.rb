class AddUserToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :user_id, :integer
    add_index :categories, :user_id
  end
end
