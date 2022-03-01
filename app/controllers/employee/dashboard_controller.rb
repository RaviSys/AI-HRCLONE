class Employee::DashboardController < EmployeeController
  before_action :set_current_employee

  def index; end

  def profile; end

  private 

  def set_current_employee
    @current_employee = Employee.find_by(work_email: current_user.email)
  end
end
