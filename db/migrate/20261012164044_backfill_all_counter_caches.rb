class BackfillAllCounterCaches < ActiveRecord::Migration[8.1]
  def up
    Department.find_each do |department|
      Department.reset_counters(department.id, :students)
      Department.reset_counters(department.id, :teachers)
      Department.reset_counters(department.id, :laboratories)
    end

    Subject.find_each do |subject|
      Subject.reset_counters(subject.id, :sections)
    end

    Section.find_each do |section|
      Section.reset_counters(section.id, :classlists)
    end

    Student.find_each do |student|
      Student.reset_counters(student.id, :classlists)
    end
  end

  def down
    # Optional, can be left blank for backfills
  end
end
