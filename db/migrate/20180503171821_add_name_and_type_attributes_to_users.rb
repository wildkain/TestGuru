class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    rename_column :users, :name, :firstname
    add_column :users, :lastname, :string
    add_index :users, :type
  end
end
