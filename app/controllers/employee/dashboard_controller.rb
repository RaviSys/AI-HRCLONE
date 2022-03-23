class Employee::DashboardController < EmployeeController
  helper_method :even_raw_swipes
  def index
    @upcoming_birthdays = Employee.current_month_birthdays
  end

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

  def profile_params
    params.require(:employee).permit!
  end

  def even_raw_swipes
    @current_employee.attendance_swipes.count % 2 == 0
  end
end
