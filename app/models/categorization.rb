# frozen_string_literal: true

class Categorization < ApplicationRecord
  belongs_to :test
  belongs_to :category
end
