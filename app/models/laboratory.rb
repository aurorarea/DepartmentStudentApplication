class Laboratory < ApplicationRecord
  belongs_to :department, counter_cache: :laboratory

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
