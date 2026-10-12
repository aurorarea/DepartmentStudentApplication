class Student < ApplicationRecord
  belongs_to :department, counter_cache: :studentsCount
  has_many :classlists, dependent: :destroy
  has_many :sections, through: :classlists, dependent: :destroy
end
