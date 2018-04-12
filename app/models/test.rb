class Test < ApplicationRecord
has_many :tests_progresses
has_many :users, through: :tests_progresses

  def self.get_titles(category_name)
    Test.joins("JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", category_name ).order(title: :desc).pluck(:title)
  end
end
