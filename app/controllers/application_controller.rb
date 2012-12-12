class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :catch_not_found
  before_filter :authorize


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

  def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, notice: "Please log in"
		end
	end

end