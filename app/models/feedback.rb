class Feedback < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, presence: true
  validates :body,  presence: true
end
