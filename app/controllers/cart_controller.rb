class CartController < ApplicationController

  	def show
  		@cart_items = Cart.all
  	end

  	def add_to_cart
  		product = Product.find(params[:product_id])

  		if Cart.find_by(:product_id => product.id, :session_id => request.session_options[:id])
  			cart = Cart.find_by(:product_id => product.id, :session_id => request.session_options[:id])
  			cart.quantity += params[:quantity].to_i
  			cart.save
  		else
  			Cart.create(:product_id => product.id, :session_id => request.session_options[:id], :quantity => params[:quantity])
  		end

  		render :json => {:response => true}
  	end
  	
end
