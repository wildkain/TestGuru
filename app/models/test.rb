class Test < ApplicationRecord
has_many :test_passages
has_many :users, through: :test_passages
has_many :categorizations
has_many :categories, through: :categorizations
has_many :questions
belongs_to :author, class_name: 'User', foreign_key: "author_id", optional: true

scope :easy,   -> { where(level: 0..1) }
scope :medium, -> { where(level: 2..4) }
scope :hard,   -> { where(level: 5..Float::INFINITY) }
scope :with_level,  -> (level) { where(level: level ) }
scope :by_category, -> (category) {  joins(:category).where(categories: { title: category }).order(title: :desc) }

validates :title, presence: true,
                  uniqueness: { scope: :level, message: "Should be  only one title-level" }
validates :level, numericality: { only_integer: true, greater_than: 0 }

  def self.get_titles(category_name)
    by_category(category_name).pluck(:title)
  end
end
