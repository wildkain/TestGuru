# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy]

  def new
    @badge = Badge.new
  end

  def create
    badge = Badge.new(badge_params)
    if badge.save
      redirect_to admin_badges_path, notice: 'Badge successfully saved!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: 'Successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  def index
    @badges = Badge.all
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :description, :image, :rule, :rule_parameter)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
