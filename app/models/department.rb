class Department < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :teachers, dependent: :destroy
  has_many :laboratories, dependent: :destroy
  has_paper_trail

  def self.ransackable_attributes(auth_object = nil)
    [ "location", "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "students", "teachers", "laboratories" ]
  end
end
