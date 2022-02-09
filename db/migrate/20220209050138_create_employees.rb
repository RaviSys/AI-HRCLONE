class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :employee_code
      t.string :first_name
      t.string :last_name
      t.string :personal_email
      t.string :work_email
      t.string :permanent_mobile_number
      t.string :alternate_mobile_number
      t.string :permanent_address
      t.string :resedential_address
      t.date :date_of_birth

      t.timestamps
    end
  end
end
