class StoreController < ApplicationController
	skip_before_filter :authorize

  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @cart = current_cart
    end

  	@products = Product.order(:title)  # Retrieving Objects from the Database(Product.find_by_title)
  	@cart = current_cart

  	if session[:counter].nil?
       session[:counter] = 1
    else
      session[:counter] += 1
    end
  end
end
