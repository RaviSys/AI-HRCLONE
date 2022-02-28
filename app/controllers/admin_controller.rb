class AdminController < ApplicationController
  before_action :verify_admin_user?

  private

  def verify_admin_user?
    if user_signed_in? && !current_user.admin?
      redirect_to root_path, alert: 'You are not authorised to access this page'
    end
  end
end