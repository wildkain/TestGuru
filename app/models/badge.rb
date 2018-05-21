class Badge < ApplicationRecord
  RULES = { all_tests_in_category: "All test in one category",
            on_first_try: "Pass the test on first try",
            by_level: "Pass all tests with level"
          }
  LEVELS  = { easy: "easy", medium: "medium", hard: "hard" }

  has_many :users, through: :user_badges
  has_many :user_badges
  has_attached_file :image
  validates_attachment :image,
                       content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


  validates :title, :image, presence: true
end
