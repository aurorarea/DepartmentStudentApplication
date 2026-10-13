class Section < ApplicationRecord
  belongs_to :subject, counter_cache: :sectionCount, optional: true
  has_many :classlists, dependent: :destroy
  has_many :students, through: :classlists

  def display_name
    if subject.present?
      "#{subject.name} - #{name}"
    else
      name.to_s
    end
  end
end
