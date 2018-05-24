# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(:title) }
  scope :with_name, ->(title) { where(title: title) }

  has_many :categorizations
  has_many :tests, through: :categorizations

  validates :title, presence: true,
                    uniqueness: true
end
