class Employee::AttendancesController < EmployeeController
  def capture_punch_in_swipe
    @current_employee.attendance_swipes.create(swiped_at: DateTime.now)
    redirect_to employee_dashboard_path, notice: 'Punched In successfully'
  end

  def capture_punch_out_swipe
    @current_employee.attendance_swipes.create(swiped_at: DateTime.now)
    redirect_to employee_dashboard_path, notice: 'Punched Out successfully'
  end
end