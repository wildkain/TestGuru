class Test < ApplicationRecord
  def self.get_titles(category_name)
    category = Category.find_by "title = ?", category_name
    Test.where("category_id = ?", category.id).order(title: :desc).pluck(:title)
  end
end
