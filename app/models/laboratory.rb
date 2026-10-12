class Laboratory < ApplicationRecord
  belongs_to :department, counter_cache: :laboratory
end
