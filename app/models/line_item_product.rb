class LineItemProduct < ApplicationRecord
 belongs_to :productsonsale, optional: true
 belongs_to :order, optional: true
 belongs_to :cart, optional: true

  def total_price
  productsonsale.price * (quantity || 1)
  end
end
