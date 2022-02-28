class Employee::DashboardController < EmployeeController
  def index
    @current_employee = Employee.find_by(work_email: current_user.email)
  end
end
