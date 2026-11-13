class Section < ApplicationRecord
  belongs_to :subject, counter_cache: :sectionCount, optional: true
  has_many :classlists, dependent: :destroy
  has_many :students, through: :classlists
  has_paper_trail

  after_save :recalculate_teacher_salary
  after_destroy :recalculate_teacher_salary

  def display_name
    if subject.present?
      "#{subject.name} - #{name}"
    else
      name.to_s
    end
  end

  private

  def recalculate_teacher_salary
    subject&.teacher&.update_monthly_salary!
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "subject" ]
  end
end
