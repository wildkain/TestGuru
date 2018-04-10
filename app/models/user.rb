class User < ApplicationRecord
  def show_tests_with_level(level)
    Test.where(level:level)
  end
end
