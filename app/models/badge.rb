class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :user_badges
  has_attached_file :image
  validates_attachment :image,
                       content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


  validates :title, :image, presence: true
end
