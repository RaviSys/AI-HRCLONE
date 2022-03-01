require 'rails_helper'

RSpec.describe "Employee::Dashboard", type: :request do
  let(:employee) { create(:employee) }
  let(:user) { create :employee_user, username: employee.employee_code, email: employee.work_email }
  
  describe "GET /employee/dashboard" do
    it "It should open the dashboard path for employee when employee is signed in" do
      sign_in user
      get employee_dashboard_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /employee/profile" do 
    it "It should open the employee profile page" do
      sign_in user
      get employee_profile_path
      expect(response).to have_http_status(200)
    end
  end
end
