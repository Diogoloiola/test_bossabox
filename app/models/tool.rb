class Tool < ApplicationRecord
  include Filterable

  has_many :tags, dependent: :destroy

  validates_presence_of :title, :link, :description

  scope :filter_by_tag, ->(value) { includes(:tags).where(tags: { description: value }) }
end
