class Teacher < ApplicationRecord
  belongs_to :department, counter_cache: :teachersCount
  has_many :subjects, dependent: :destroy

  def update_monthly_salary!
    return unless perUnitRate

    total_teaching_units = subjects.joins(:sections).count * 3
    new_salary = total_teaching_units * perUnitRate

    update_column(:monthlySalary, new_salary)
    end
end
