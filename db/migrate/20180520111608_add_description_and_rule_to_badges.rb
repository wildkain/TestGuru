class AddDescriptionAndRuleToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :description, :text
    add_column :badges, :rule, :text
    add_column :badges, :category_id, :integer
  end
end
