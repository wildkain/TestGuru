class Category < ApplicationRecord
  has_many :categorizations
  has_many :tests, through: :categorizations
end
