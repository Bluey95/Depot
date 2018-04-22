App.productsonsales = App.cable.subscriptions.create "ProductsonsalesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	$(".store_products #main").html(data.html)
    # Called when there's incoming data on the websocket for this channel
