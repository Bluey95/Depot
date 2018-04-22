class AddQuantityToLineItemProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :line_item_products, :quantity, :integer, default: 1
  end
end
