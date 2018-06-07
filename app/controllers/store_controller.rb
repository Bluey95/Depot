class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def increment_counter
	  if session[:counter].nil?
	    session[:counter] = 0
	  end
	  	session[:counter] += 1
	end


  def index
  	@count = increment_counter
  	@shown_message = "You've been here #{@count} times" if session[:counter] > 5
	  if params[:set_locale]
	 	redirect_to store_index_url(locale: params[:set_locale])
	  else
		@products = Product.order(:title)
	  end
  end

end
