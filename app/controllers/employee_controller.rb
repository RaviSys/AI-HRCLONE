class EmployeeController < ApplicationController
  before_action :verify_employee_user?
  before_action :set_current_employee

  private

  def verify_employee_user?
    if user_signed_in? && !current_user.employee?
      redirect_to root_path, alert: 'You are not authorised to access this page'
    end
  end

  def set_current_employee
    @current_employee = Employee.find_by(work_email: current_user.email)
  end
end
