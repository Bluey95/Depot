class Order < ApplicationRecord
has_many :line_items, dependent: :destroy

attr_accessor  :address, :email, :name, :pay_type
  
PAYMENT_TYPES = [ "Check", "Credit Card", "Purchase Order" ]

validates :name, :address, :email, :pay_type, presence: true
validates :pay_type, :inclusion => PAYMENT_TYPES

enum pay_type: {
"Check" => 0,
"Credit card" => 1,
"Purchase order" => 2
}

def add_line_items_from_cart(cart)
 cart.line_items.each do |item|
 item.cart_id = nil
 line_items << item
 end
 end
end

