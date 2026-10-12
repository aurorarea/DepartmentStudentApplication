class Subject < ApplicationRecord
  belongs_to :teacher, counter_cache: true
  has_many :sections, dependent: :destroy

  after_create :update_teacher_salary_on_add
  after_destroy :update_teacher_salary_on_remove

  private

  def update_teacher_salary_on_add
    return unless teacher && teacher.perUnitRate && number_of_units

    teacher.reload
    # Add this subject's total unit earnings (units * perUnitRate) to the monthly salary
    current_salary = teacher.monthlySalary || 0.0
    added_earnings = number_of_units * teacher.perUnitRate

    teacher.update_column(:monthlySalary, current_salary + added_earnings)
  end

  def update_teacher_salary_on_remove
    return unless teacher && teacher.perUnitRate && number_of_units

    teacher.reload
    # Subtract this subject's earnings when removed
    current_salary = teacher.monthlySalary || 0.0
    deducted_earnings = number_of_units * teacher.perUnitRate

    teacher.update_column(:monthlySalary, [ current_salary - deducted_earnings, 0.0 ].max)
  end
end
