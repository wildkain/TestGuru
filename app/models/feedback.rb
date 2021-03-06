# frozen_string_literal: true

class Feedback < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, :body, presence: true
end
