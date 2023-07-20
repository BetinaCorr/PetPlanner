class Professional < ApplicationRecord
  has_many :services, dependent: :destroy
  belongs_to :pet
end
