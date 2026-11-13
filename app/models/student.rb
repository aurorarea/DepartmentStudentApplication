class Student < ApplicationRecord
  belongs_to :department, counter_cache: :studentsCount
  has_many :classlists, dependent: :destroy
  has_many :sections, through: :classlists, dependent: :destroy
  has_paper_trail

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "year_level", "program" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "department" ]
  end
end