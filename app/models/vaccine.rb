class Vaccine < ApplicationRecord
  belongs_to :pet

  validates :name, :administration_date, presence: true
end
