class EmployeeController < ApplicationController
  before_action :verify_employee_user?

  private

  def verify_employee_user?
    if user_signed_in? && !current_user.employee?
      redirect_to root_path, alert: 'You are not authorised to access this page'
    end
  end
end
