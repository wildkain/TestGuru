class User < ApplicationRecord
  def show_tests_with_level(level_value)
    Test.joins("INNER JOIN passed_tests ON passed_tests.test_id = tests.id").where("passed_tests.user_id =  ? AND tests.level = ?", self.id, level_value )
  end
end
