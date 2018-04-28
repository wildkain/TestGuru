class DropTableTestsProgresses < ActiveRecord::Migration[5.1]
  def change
    drop_table :tests_progresses
  end
end
