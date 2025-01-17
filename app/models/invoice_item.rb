class InvoiceItem < ApplicationRecord
  enum status: [:packaged, :pending, :shipped, :unknown]

  belongs_to :item
  belongs_to :invoice

  def item_name
    item.name
  end

  def formatted_date
    invoice.formatted_date
  end
end
