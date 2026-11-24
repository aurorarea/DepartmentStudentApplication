class Department < ApplicationRecord
  has_many :students, dependent: :restrict_with_error
  has_many :teachers, dependent: :restrict_with_error
  has_many :laboratories, dependent: :restrict_with_error
  has_paper_trail

  def self.ransackable_attributes(auth_object = nil)
    [ "location", "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "students", "teachers", "laboratories" ]
  end

  validates :name, presence: true, uniqueness: true, 	length: { maximum: 100 }
  validates :location, presence: true
end
