# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def faker_phone_number
  Faker::PhoneNumber.cell_phone_with_country_code
end

def faker_email
  Faker::Internet.email
end

def faker_address
  Faker::Address.full_address
end

def faker_name
  Faker::Name
end

1000.times do |i|
  puts "Creating employee #{i+1}"
  Employee.create(
    first_name: faker_name.first_name,
    last_name: faker_name.last_name,
    work_email: faker_email,
    personal_email: faker_email,
    permanent_mobile_number: faker_phone_number,
    alternate_mobile_number: faker_phone_number,
    permanent_address: faker_address,
    resedential_address: faker_address,
    date_of_birth: Date.today - rand(25..30).years,
    employee_code: "EMP#{2021000000+i+1}",
    gender: Employee::GENDER.sample
  )
end
