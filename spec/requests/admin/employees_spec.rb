require 'rails_helper'

RSpec.describe "Admin::Employees", type: :request do
  let(:user) { create(:admin_user) }
  describe "GET /admin/employees" do
    context 'when admin user signed in'  do 
      it "redirect to admin dashboard" do
        sign_in user
        get admin_dashboard_path
        expect(response).to have_http_status(200)
      end

      it "display employee list" do
        sign_in user
        get admin_employees_path
        expect(response).to have_http_status(200)
      end
    end

    context 'when admin user signed in'  do 
      it "will redirect to root path" do 
        get admin_employees_path
        expect(response).to have_http_status(302)
        get new_user_session_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe 'POST /admin/employees' do 
    it "will redirect on employee show page" do 
      sign_in user
      params = {
        employee: {
          first_name:  Faker::Name.first_name,
          last_name:  Faker::Name.last_name,
          work_email:  Faker::Internet.email,
          personal_email:  Faker::Internet.email,
          permanent_mobile_number:  Faker::PhoneNumber.cell_phone_with_country_code,
          alternate_mobile_number:  Faker::PhoneNumber.cell_phone_with_country_code,
          permanent_address:  Faker::Address.full_address,
          resedential_address:  Faker::Address.full_address,
          date_of_birth:  Date.today - rand(25..30).years,
          employee_code:  "EMP#{2021000000 + rand(1..9)}",
          gender:  Employee::GENDER.sample
        }
      }
      post admin_employees_path(params: params)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to admin_employee_path(1)
    end
  end
end
