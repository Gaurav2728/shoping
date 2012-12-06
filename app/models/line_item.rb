class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  #attr_accessible :product # solution of-> ActiveModel::MassAssignmentSecurity::Error in LineItemsController#create
  belongs_to :product
	belongs_to :cart

	def total_price
		product.price * quantity
	end

end
