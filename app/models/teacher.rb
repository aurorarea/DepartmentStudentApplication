class Teacher < ApplicationRecord
  belongs_to :department, counter_cache: :teachersCount
  has_many :subjects, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  has_paper_trail

  def update_monthly_salary!
    return unless perUnitRate

    total_teaching_units = subjects.joins(:sections).count * 3
    new_salary = total_teaching_units * perUnitRate

    update_column(:monthlySalary, new_salary)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "email", "specialization" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "department" ]
  end
end
