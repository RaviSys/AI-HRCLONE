json.extract! employee, :id, :first_name, :last_name, :personal_email, :work_email, :permanent_mobile_number, :alternate_mobile_number, :permanent_address, :resedential_address, :date_of_birth, :created_at, :updated_at
json.url employee_url(employee, format: :json)
