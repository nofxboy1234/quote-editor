class LineItemDate < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :line_items_ordered, -> { order(name: :asc) }, class_name: 'LineItem'
  belongs_to :quote

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :desc) }
  # scope :with_ordered_line_items, -> { includes(:line_items).order('line_items.name' => :asc) }

  def previous_date
    quote.line_item_dates.ordered.where('date < ?', date).last
  end
end
