json.extract! line_item_product, :id, :productsonsale_id, :cart_id, :created_at, :updated_at
json.url line_item_product_url(line_item_product, format: :json)
