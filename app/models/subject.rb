class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :sections, dependent: :destroy

  after_save :recalculate_teacher_salary
  after_destroy :recalculate_teacher_salary

  private

  def recalculate_teacher_salary
    teacher&.update_monthly_salary!
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "teacher" ]
  end
end
