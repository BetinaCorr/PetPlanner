class Professional < ApplicationRecord
  has_many :services, dependent: :destroy
end
