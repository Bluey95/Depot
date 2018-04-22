class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  has_many :line_item_products, :dependent => :destroy

  def add_product(product)
current_item = line_items.find_by(product_id: product.id)
if current_item
    current_item.quantity ||= 1; current_item.quantity += 1
else
current_item = line_items.build(product_id: product.id)
end
current_item
end

def add_productsonsale(productsonsale)
current_item = line_item_products.find_by(productsonsale_id: productsonsale.id)
if current_item
  current_item.quantity ||= 1; current_item.quantity += 1
else
current_item = line_item_products.build(productsonsale_id: productsonsale.id)
end
current_item
end

def total_price
  total_price = line_items.to_a.sum { |item| item.total_price } + line_item_products.to_a.sum { |item| item.total_price }
  return total_price
end

# def total_price
#   line_item_products.to_a.sum { |item| item.total_price }
# end

def decrease(line_item_id)
    current_item = line_items.find(line_item_id)
    if current_item.quantity > 1
      current_item.quantity -= 1
    else
      current_item.destroy
    end
    current_item
  end

  def decrease(line_item_product_id)
      current_item = line_item_products.find(line_item_product_id)
      if current_item.quantity > 1
        current_item.quantity -= 1
      else
        current_item.destroy
      end
      current_item
    end

  def increase(line_item_id)
    current_item = line_items.find(line_item_id)
    current_item.quantity += 1
    current_item
  end

  def increase(line_item_product_id)
    current_item = line_item_products.find(line_item_product_id)
    current_item.quantity += 1
    current_item
  end
end
