class User < ApplicationRecord
has_many :tests_progresses
has_many :tests, through: :tests_progresses

validates :email, presence: true,
                  uniqueness: true

  def show_tests_with_level(level_value)
    self.tests.with_level(level_value)
  end
end
