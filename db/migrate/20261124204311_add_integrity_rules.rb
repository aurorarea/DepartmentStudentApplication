class AddIntegrityRules < ActiveRecord::Migration[8.1]
  def change
    change_column_null :teachers, :email, false
    add_index :teachers, :email, unique: true

    change_column_null :students, :name, false
    add_check_constraint :students, "year_level BETWEEN 1 AND 5", name: "students_year_level_range"

    add_index :classlists, [ :student_id, :section_id ], unique: true

    add_check_constraint :classlists, "grade IS NULL OR grade BETWEEN 50 AND 100", name: "classlists_grade_range"
    add_check_constraint :classlists, "remarks IN ('PASSED', 'FAILED')", name: "classlists_remarks_allowed"

    change_column_null :departments, :name, false
    change_column_null :departments, :location, false
    add_index :departments, :name, unique: true

    change_column_null :laboratories, :name, false
    change_column_null :laboratories, :location, false
    add_index :laboratories, :name, unique: true

    change_column_null :sections, :name, false
    change_column_null :sections, :room, false
    change_column_null :sections, :timeslot, false

    change_column_null :subjects, :name, false
    add_index :subjects, :name, unique: true
  end
end
