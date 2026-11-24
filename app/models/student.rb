class Student < ApplicationRecord
  belongs_to :department, counter_cache: :studentsCount
  has_many :classlists, dependent: :destroy
  has_many :sections, through: :classlists, dependent: :destroy
  has_paper_trail

  after_create_commit do
    NewStudentNotifier.with(record: self).deliver(Teacher.all)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "year_level", "program" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "department" ]
  end

  validates :name, presence: true, length: { maximum: 100 }
  validates :program, presence: true, length: { maximum: 50 }
  validates :year_level, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :tuitionFee, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
