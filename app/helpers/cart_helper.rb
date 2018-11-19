module CartHelper

	def total_price
 		total = 0
 		cart_items = Cart.where(:session_id => session.id)
   		cart_items.each do |item|
   			product = Product.find(item.product_id)
   			total += product.get_price * item.quantity
   		end
   		total
 	end

 	def total_itens
 		Cart.where(:session_id => session.id).count
 	end

end
