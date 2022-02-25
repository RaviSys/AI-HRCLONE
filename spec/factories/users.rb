FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { password }

    factory :admin_user do 
      role { 'admin' }
      username { 'admin123' }
    end

    factory :employee_user do 
      role { 'employee' }
    end
  end
end
