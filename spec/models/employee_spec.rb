require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { create(:employee) }
  it "is valid employee" do 
    expect(employee).to be_valid
  end
end
