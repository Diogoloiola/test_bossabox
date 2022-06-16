class Tool < ApplicationRecord
  include Filterable

  has_many :tags, dependent: :destroy

  scope :filter_by_tag, ->(value) { includes(:tags).where(tags: { description: value }) }
end
