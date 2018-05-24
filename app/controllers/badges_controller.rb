# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @user_badges = current_user.badges
  end
end
