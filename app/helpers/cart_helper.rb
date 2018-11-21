module CartHelper

	def total_price
 		total = 0
 		cart_items = Cart.where(:session_id => session[:cart_id])
   		cart_items.each do |item|
   			product = Product.find(item.product_id)
   			total += product.get_price * item.quantity
   		end
   		total
 	end

 	def total_itens
 		Cart.where(:session_id => session[:cart_id]).sum(:quantity)
 	end

 	def cart_clear
 		Cart.where(:session_id => session[:cart_id]).delete_all
 	end

end
