class CreateTestsProgresses < ActiveRecord::Migration[5.1]
  def change
    create_table :tests_progresses do |t|
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end
  end
end
