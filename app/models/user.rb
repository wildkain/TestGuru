class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def show_tests_with_level(level_value)
    self.tests.with_level(level_value)
  end
end
