class AddDescriptionToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :description, :text
  end
end
