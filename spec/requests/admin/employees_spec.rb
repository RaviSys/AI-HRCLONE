require 'rails_helper'

RSpec.describe "Admin::Employees", type: :request do
  describe "GET /admin/employees" do
    
    it "will display employee list if user signed in" do
      user = create(:admin_user)
      sign_in user
      get admin_employees_path
      expect(response).to have_http_status(200)
    end

    it "will redirect to root path if user not signed in" do 
      get admin_employees_path
      expect(response).to have_http_status(302)
      get new_user_session_path
      expect(response).to have_http_status(200)
    end

  end
end
