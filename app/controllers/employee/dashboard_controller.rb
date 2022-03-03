class Employee::DashboardController < EmployeeController
  before_action :set_current_employee

  def index; end

  def profile; end

  def edit_profile; end

  def update_profile
    if @current_employee.update(profile_params)
      redirect_to employee_profile_path, notice: 'Profile updated successfully'
    else
      render :edit_profile
    end
  end

  private 

  def set_current_employee
    @current_employee = Employee.find_by(work_email: current_user.email)
  end

  def profile_params
    params.require(:employee).permit!
  end
end
