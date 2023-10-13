class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  # The below line delegates the :quote method to the LineItem#line_item_date method.
  # This makes the two following lines equivalent:
  
  # line_item.line_item_date.quote
  # line_item.quote
  delegate :quote, to: :line_item_date

  # default_scope { order(name: :asc) }
  scope :ordered, -> { order(name: :asc) }

  def total_price
    quantity * unit_price
  end
end
