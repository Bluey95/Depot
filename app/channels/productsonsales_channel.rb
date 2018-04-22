class ProductsonsalesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "productsonsales"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
