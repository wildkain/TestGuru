# frozen_string_literal: true

class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
end
