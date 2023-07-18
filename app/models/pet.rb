class Pet < ApplicationRecord
  belongs_to :user
  has_many :foods, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :vaccines, dependent: :destroy
end
