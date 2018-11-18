class Product < ApplicationRecord
	belongs_to :brand


	def get_price
  		if has_promotion
  			promotional_price
  		else
  			price
  		end
  	end

  	def quantity_in_cart(session_id)
  		cart = Cart.find_by(:product_id => id, :session_id => session_id)
  		quantity = nil

  		if cart
  			quantity = cart.quantity
  		else
  			quantity = 0
  		end
  		
  		quantity
  	end

end
