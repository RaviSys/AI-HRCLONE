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

  describe "PATCH /employee/update_profile" do 
    it "It should update the employee profile" do
      sign_in user
      params = {
        employee: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          work_email: Faker::Internet.email,
          personal_email: Faker::Internet.email,
          permanent_mobile_number: Faker::PhoneNumber.cell_phone_with_country_code,
          alternate_mobile_number: Faker::PhoneNumber.cell_phone_with_country_code,
          permanent_address: Faker::Address.full_address,
          resedential_address: Faker::Address.full_address,
          date_of_birth: Date.today - rand(25..30).years,
          gender: Employee::GENDER.sample
        }
      }
      patch employee_update_profile_path(params: params)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to employee_profile_path
    end
  end
end
