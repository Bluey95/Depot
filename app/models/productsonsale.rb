class Productsonsale < ApplicationRecord
# validating that the price is a valid positive number
validates :price, numericality: {greater_than_or_equal_to: 0.01}

# validating that each product title is unique
validates :title,uniqueness: true, :length => {
    :minimum => 10,
    :message => 'The product title must be at least ten characters long.'
}

# validating that the url entered for the image is valid
validates :image_url, allow_blank: true, format: {
with: %r{\.(gif|jpg|png)\Z}i,
message: 'must be a URL for GIF, JPG or PNG image.'

}

has_many :line_item_products
before_destroy :ensure_not_referenced_by_any_line_item_product

private
 # ensure that there are no line item products referencing this product
  def ensure_not_referenced_by_any_line_item_product
    unless line_item_products.empty?
      errors.add(:base, 'Line Items Products present')
      throw :abort
   end
 end
end
