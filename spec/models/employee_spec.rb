require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { create(:employee) }
  it "is valid employee" do 
    expect(employee).to be_valid
  end

  describe 'Creating a new employee' do 
    let(:user) { create(:employee_user, username: employee.employee_code, email: employee.work_email) }
    it "should create a new user" do 
      expect(user.username).to eq(employee.employee_code)
      expect(user.email).to eq(employee.work_email)
    end
  end
end
