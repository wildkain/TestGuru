class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.text :title
      t.attachment :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
