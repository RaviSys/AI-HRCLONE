require 'rails_helper'

RSpec.describe "Employee::Employees", type: :request do
  describe "GET /employee/employees" do
    let(:employee) { create(:employee) }
    let(:user) { create :employee_user, username: employee.employee_code }
    it "It should open the dashboard path for employee when employee is signed in" do
      sign_in user
      get employee_dashboard_path
      expect(response).to have_http_status(200)
    end
  end
end
