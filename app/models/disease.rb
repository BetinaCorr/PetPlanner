class Disease < ApplicationRecord
  belongs_to :pet

  validates :name, :category, presence: true

end
