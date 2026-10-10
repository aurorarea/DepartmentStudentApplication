class Classlist < ApplicationRecord
  belongs_to :section, counter_cache: :studentsCount
  belongs_to :student

  after_create :student_enrolled
  after_destroy :student_dropped
  after_update :enrollment_was_edited

  private

  def subject
    section&.subject
  end

  def student_enrolled
    return unless student && subject
    add_subject_to(student, subject)
  end

  def student_dropped
    return unless student && subject
    remove_subject_from(student, subject)
  end

  def enrollment_was_edited
    return unless saved_change_to_section_id? || saved_change_to_student_id?

    old_student_id = student_id_before_last_save || student_id
    old_section_id = section_id_before_last_save || section_id

    old_student = Student.find_by(id: old_student_id)
    old_section = Section.find_by(id: old_section_id)

    remove_subject_from(old_student, old_section.subject) if old_student && old_section&.subject

    add_subject_to(student, subject) if student && subject
  end

  def add_subject_to(a_student, a_subject)
    a_student.reload

    units = a_subject.respond_to?(:numberOfUnits) && a_subject.numberOfUnits.present? ? a_subject.numberOfUnits : 3
    rate = a_subject.teacher&.perUnitRate || 0.0

    a_student.subjectsCount = (a_student.subjectsCount || 0) + 1
    a_student.numberOfUnits = (a_student.numberOfUnits || 0) + units
    a_student.tuitionFee    = (a_student.tuitionFee || 0.0) + (units * rate)
    a_student.save!
  end

  def remove_subject_from(a_student, a_subject)
    a_student.reload

    units = a_subject.respond_to?(:numberOfUnits) && a_subject.numberOfUnits.present? ? a_subject.numberOfUnits : 3
    rate = a_subject.teacher&.perUnitRate || 0.0

    a_student.subjectsCount = [ (a_student.subjectsCount || 0) - 1, 0 ].max
    a_student.numberOfUnits = [ (a_student.numberOfUnits || 0) - units, 0 ].max
    a_student.tuitionFee    = [ (a_student.tuitionFee || 0.0) - (units * rate), 0.0 ].max
    a_student.save!
  end
end