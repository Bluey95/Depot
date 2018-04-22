class AddOrderToLineItemProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :line_item_products, :order, foreign_key: true
  end
end
