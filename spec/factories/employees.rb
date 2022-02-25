FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    work_email { Faker::Internet.email }
    personal_email { Faker::Internet.email }
    permanent_mobile_number { Faker::PhoneNumber.cell_phone_with_country_code }
    alternate_mobile_number { Faker::PhoneNumber.cell_phone_with_country_code }
    permanent_address { Faker::Address.full_address }
    resedential_address { Faker::Address.full_address }
    date_of_birth { Date.today - rand(25..30).years }
    employee_code { "EMP#{2021000000 + rand(1..9)}" }
    gender { Employee::GENDER.sample }
  end
end
