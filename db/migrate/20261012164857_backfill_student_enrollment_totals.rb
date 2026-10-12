class BackfillStudentEnrollmentTotals < ActiveRecord::Migration[8.1]
  def up
    Student.find_each do |student|
      subjects_count = 0
      number_of_units = 0
      tuition_fee = 0.0

      student.classlists.each do |classlist|
        subject = classlist.section.subject
        teacher = subject.teacher

        subjects_count += 1
        number_of_units += subject.numberOfUnits # Make sure this matches if subject uses numberOfUnits too

        if teacher && teacher.perUnitRate # Use camelCase here
          tuition_fee += subject.numberOfUnits * teacher.perUnitRate # Use camelCase here
        end
      end

      student.update_columns(
        subjectsCount: subjects_count,     # Match database column
        numberOfUnits: number_of_units,    # Match database column
        tuitionFee: tuition_fee            # Match database column
      )
    end
  end

  def down
  end
end
