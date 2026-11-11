class Student < ApplicationRecord
  belongs_to :department, counter_cache: :studentsCount
  has_many :classlists, dependent: :destroy
  has_many :sections, through: :classlists, dependent: :destroy

 # searching columns on the students table
 def self.ransackable_attributes(auth_object = nil)
    [ "name", "year_level", "program" ]
 end

  # searching associated models (e.g., student.department)
  def self.ransackable_associations(auth_object = nil)
    [ "department" ]
  end
end
