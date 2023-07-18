class Vaccine < ApplicationRecord
  belongs_to :pet

  validates :name, :administration_datedate, presence: true
end
