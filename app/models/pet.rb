class Pet < ApplicationRecord
  belongs_to :user
  has_many :foods, dependent: :destroy
  has_many :services, dependent: :destroy
end
