class Employee < ApplicationRecord
  paginates_per 20
  GENDER = %w{male female}
  has_many :attendance_swipes
  validates :first_name, :last_name, presence: true,
            format: { 
              with: /\A[a-zA-Z]+\z/,
              message: "only allows letters" 
            }
  validates :gender, presence: true,
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

  scope :current_month_birthdays, -> { where('EXTRACT(day FROM date_of_birth) > ? AND EXTRACT(month FROM date_of_birth) <= ?', current_date, month_end) }

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

  def dob_with_age
    "#{date_of_birth} (#{age} years)"
  end

  def self.month_end
    Date.today.end_of_month.strftime("%m")
  end

  def self.current_date
    Date.today.strftime("%d")
  end

  def latest_swipe
    attendance_swipes.last.swiped_at.strftime("%A %d %b at %H:%M")
  end
end
