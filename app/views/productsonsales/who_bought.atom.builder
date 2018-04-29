atom_feed do |feed|
feed.title "Who bought #{@productsonsale.title}"
feed.updated @latest_order.try(:updated_at)
@productsonsale.orders.each do |order|
feed.entry(order) do |entry|
entry.title "Order #{order.id}"
entry.summary type: 'xhtml' do |xhtml|
xhtml.p "Shipped to #{order.address}"
xhtml.table do
xhtml.tr do
xhtml.th 'Productsonsale'
xhtml.th 'Quantity'
xhtml.th 'Total Price'
end
order.line_item_products.each do |item|
xhtml.tr do
xhtml.td item.productsonsale.title
xhtml.td item.quantity
xhtml.td number_to_currency item.total_price
end
end
xhtml.tr do
xhtml.th 'total', colspan: 2
xhtml.th number_to_currency \
order.line_item_products.map(&:total_price).sum
end
end
xhtml.p "Paid by #{order.pay_type}"
end
entry.author do |author|
author.name order.name
author.email order.email
end
end
end
end