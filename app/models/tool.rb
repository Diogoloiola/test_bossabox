class Tool < ApplicationRecord
  include Filterable

  attr_reader :tags

  has_many :tags, dependent: :destroy

  validates_presence_of :title, :link, :description

  scope :filter_by_tag, ->(value) { includes(:tags).where(tags: { description: value }) }

  affter_save :save_tags

  private

  def save_tags
    tags.each do |tag|
      Tag.create!(description: tag, tool_id: id)
    end
  end
end
