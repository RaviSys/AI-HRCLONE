require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Alternate mobile number", with: @employee.alternate_mobile_number
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "First name", with: @employee.first_name
    fill_in "Last name", with: @employee.last_name
    fill_in "Permanent address", with: @employee.permanent_address
    fill_in "Permanent mobile number", with: @employee.permanent_mobile_number
    fill_in "Personal email", with: @employee.personal_email
    fill_in "Resedential address", with: @employee.resedential_address
    fill_in "Work email", with: @employee.work_email
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Alternate mobile number", with: @employee.alternate_mobile_number
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "First name", with: @employee.first_name
    fill_in "Last name", with: @employee.last_name
    fill_in "Permanent address", with: @employee.permanent_address
    fill_in "Permanent mobile number", with: @employee.permanent_mobile_number
    fill_in "Personal email", with: @employee.personal_email
    fill_in "Resedential address", with: @employee.resedential_address
    fill_in "Work email", with: @employee.work_email
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
