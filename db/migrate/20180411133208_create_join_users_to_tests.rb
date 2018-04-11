class CreateJoinUsersToTests < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tests, :users, table_name: :passed_tests do |t|
      t.index :test_id
      t.index :user_id
    end

  end
end
