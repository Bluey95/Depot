json.extract! productsonsale, :id, :title, :description, :image_url, :price, :created_at, :updated_at
json.url productsonsale_url(productsonsale, format: :json)
