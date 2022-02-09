class Employee < ApplicationRecord
  GENDER = %w{male female}

  validates :first_name, :last_name, presence: true,
            format: { 
              with: /\A[a-zA-Z]+\z/,
              message: "only allows letters" 
            }
  validates :gender, 
            inclusion: { 
              in: %w(male female),
              message: "%{value} is not a valid gender" 
            }
  validates :work_email, :personal_email, 
            presence: true, uniqueness: true
  validates :permanent_mobile_number,
            :alternate_mobile_number,
            :permanent_address,
            :resedential_address, 
            :date_of_birth, presence: true

  validate :validate_age_of_employee

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def age
    Date.today.year - date_of_birth.year
  end

  def validate_age_of_employee
    if date_of_birth.present? && age < 18
      errors.add(:employee_age, 'is very low. Employee must be 18+ years old')
    end
  end
end
