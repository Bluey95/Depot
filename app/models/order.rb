class Order < ApplicationRecord
has_many :line_items, :dependent => :destroy
has_many :line_item_products, :dependent => :destroy

attr_accessor  :address, :email, :name, :pay_type

enum pay_type: {
"Check" => 0,
"Credit card" => 1,
"Purchase order" => 2
}

validates :name, :address, :email, presence: true
validates :pay_type, :inclusion => pay_types.keys
# PAYMENT_TYPES = [ "Check", "Credit Card", "Purchase Order" ]
  
# PAYMENT_TYPES = [ "Check", "Credit Card", "Purchase Order" ]






def add_line_items_from_cart(cart)
	 cart.line_items.each do |item|
	 item.cart_id = nil
	 line_items << item
	 end
end

def add_line_item_products_from_cart(cart)
 	cart.line_item_products.each do |item|
 		item.cart_id = nil
 		line_item_products << item
 	end
end
 

 
end

