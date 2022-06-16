class Tag < ApplicationRecord
  belongs_to :tool
  validates :description, presence: true
end
