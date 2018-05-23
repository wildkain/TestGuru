class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.text :title
      t.attachment :image
      t.references :user, foreign_key: true
      t.text :description
      t.text :rule
      t.integer :rule_parameter
      t.timestamps
    end
  end
end
