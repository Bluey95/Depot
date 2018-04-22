class CombineItemsInCart < ActiveRecord::Migration[5.0]

	  def up
		# replace multiple items for a single product in a cart with a
		# single item
		Cart.all.each do |cart|
			# count the number of each productonsale in the Cart
			sums = cart.line_item_products.group(:productsonsale_id).sum(:quantity)

			# count the number of each service in the Cart
			adds = cart.line_items.group(:product_id).sum(:quantity)

			sums.each do |productsonsale_id,  quantity|
				if quantity > 1
					# remove individual items
					cart.line_item_products.where(productsonsale_id: productsonsale_id).delete_all
					# replace with a single item
					item = cart.line_item_products.build(productsonsale_id: productsonsale_id)
					item.quantity = quantity
					item.save!
				end
			end

			adds.each do |product_id, quantity|
				if quantity > 1
					# remove individual items
					cart.line_items.where(product_id: product_id).delete_all
					# replace with a single item
					item = cart.line_items.build(product_id: product_id)
					item.quantity = quantity
					item.save!
				end
			end

		end
	end

	def down
		# split items with quantity>1 into multiple items
		LineItemProduct.where("quantity>1").each do |line_item_product|
			# add individual items
			line_item_product.quantity.times do
				LineItemProduct.create(
				cart_id: line_item_product.cart_id,
				product_id: line_item_product.productsonsale_id,
				quantity: 1
				)
			end
			# remove original item
			line_item_product.destroy
		end

		LineItem.where("quantity>1").each do |line_item|
			# add individual items
			line_item.quantity.times do
				LineItem.create(
				cart_id: line_item.cart_id,
				product_id: line_item.product_id,
				quantity: 1
				)
			end
			# remove original item
			line_item.destroy
		end
	end

end