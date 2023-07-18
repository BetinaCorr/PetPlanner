class Service < ApplicationRecord
  belongs_to :pet
  belongs_to :professional

  validates :name_service, :starts_at, :ends_at, presence: true
end
