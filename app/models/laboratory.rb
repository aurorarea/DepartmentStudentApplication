class Laboratory < ApplicationRecord
  belongs_to :department, counter_cache: :laboratory

  validates :name, presence: true, uniqueness: true, 	length: { maximum: 50 }
  validates :location, presence: true
end
