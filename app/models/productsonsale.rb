class Productsonsale < ApplicationRecord
# validating that the text fields all contain some something before a row is wrotten to the database
validates :title, :description, :image_url, presence: true

# validating that the price is a valid positive number 
validates :price, numericality: {greater_than_or_equal_to: 0.01}

# validating that each product title is unique
validates :title, uniqueness: true

# validating that the url entered for the image is valid
validates :image_url, allow_blank: true, format: {
with: %r{\.(gif|jpg|png)\Z}i,
message: 'must be a URL for GIF, JPG or PNG image.'

}
end
