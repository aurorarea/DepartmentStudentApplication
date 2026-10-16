class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :sections, dependent: :destroy

  after_save :recalculate_teacher_salary
  after_destroy :recalculate_teacher_salary

  private

  def recalculate_teacher_salary
    teacher&.update_monthly_salary!
  end
end
