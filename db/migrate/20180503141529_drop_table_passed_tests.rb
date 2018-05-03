class DropTablePassedTests < ActiveRecord::Migration[5.1]
  def change
    drop_table :passed_tests
  end
end
