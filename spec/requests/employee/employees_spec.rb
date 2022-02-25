require 'rails_helper'

RSpec.describe "Employee::Employees", type: :request do
  describe "GET /employee/employees" do
    it "works! (now write some real specs)" do
      get employee_employees_path
      expect(response).to have_http_status(200)
    end
  end
end
