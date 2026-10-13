class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :sections, dependent: :destroy

  after_create :update_teacher_salary_on_add
  after_destroy :update_teacher_salary_on_remove

  private

  def update_teacher_salary_on_add
    return unless teacher && teacher.perUnitRate && self.attributes["numberOfUnits"]

    teacher.reload
    current_salary = teacher.monthlySalary || 0.0
    added_earnings = self.attributes["numberOfUnits"] * teacher.perUnitRate

    teacher.update_column(:monthlySalary, current_salary + added_earnings)
  end

  def update_teacher_salary_on_remove
    return unless teacher && teacher.perUnitRate && self.attributes["numberOfUnits"]

    teacher.reload
    current_salary = teacher.monthlySalary || 0.0
    deducted_earnings = self.attributes["numberOfUnits"] * teacher.perUnitRate

    teacher.update_column(:monthlySalary, [ current_salary - deducted_earnings, 0.0 ].max)
  end
end
