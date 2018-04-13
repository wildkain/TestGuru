class Test < ApplicationRecord
has_many :tests_progresses
has_many :users, through: :tests_progresses
has_many :categorizations
has_many :categories, through: :categorizations
has_many :questions
belongs_to :author, class_name: "User", foreign_key: "author_id"


  def self.get_titles(category_name)
    Test.categories.where(category.title = caegory_name).order(title: :desc).pluck(:title)
  end
end
