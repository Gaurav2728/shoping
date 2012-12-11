class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :catch_not_found

  def catch_not_found
	  yield
	rescue ActiveRecord::RecordNotFound
  	redirect_to store_index_url, :flash => { :error => "Record not found." }
	end

  private
		def current_cart
			Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
  end
end