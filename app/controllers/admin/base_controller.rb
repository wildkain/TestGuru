class Admin::BaseController < ApplicationController
layout 'admin'


  before_action :authenticate_user!
  before_action :admin_requered!


  private

  def admin_requered!
    redirect_to root_path, alert: 'You are not authorized to view this page!' unless current_user.is_a?(Admin)
  end

end