class Allergy < ApplicationRecord
  belongs_to :pet

  validates :name, presence: true
end
