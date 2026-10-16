class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :sections, dependent: :destroy

  after_create :update_teacher_salary
  after_destroy :update_teacher_salary

  private

  def update_teacher_salary
    return unless teacher && teacher.perUnitRate

    teacher.reload

    # Calculate total units of all students enrolled in all sections of this subject
    total_student_units = sections.joins(classlists: :student).sum("students.numberOfUnits")

    # Or compute salary based on your course/student unit rate formula
    new_salary = total_student_units * teacher.perUnitRate

    teacher.update_column(:monthlySalary, new_salary)
  end
end
