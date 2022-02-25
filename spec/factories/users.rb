FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { password }

    factory :admin_user do 
      role { 'admin' }
      username { 'admin123' }
    end
  end
end
