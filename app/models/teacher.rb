class Teacher < ApplicationRecord
  belongs_to :department, counter_cache: :teachersCount
  has_many :subjects, dependent: :destroy
end
