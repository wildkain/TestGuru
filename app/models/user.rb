class User < ApplicationRecord
  def show_tests_with_level(level_value)
    Test.where('level = ?', level_value)
  end
end
