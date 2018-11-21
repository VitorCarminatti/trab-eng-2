class CartController < ApplicationController

  	def show
  		@cart_items = Cart.where(:session_id => session[:cart_id])
  	end

  	def add_to_cart
  		product = Product.find(params[:product_id])

  		if Cart.find_by(:product_id => product.id, :session_id => session[:cart_id])
  			cart = Cart.find_by(:product_id => product.id, :session_id => session[:cart_id])
  			cart.quantity += params[:quantity].to_i
  			cart.save
  		else
  			Cart.create(:product_id => product.id, :session_id => session[:cart_id], :quantity => params[:quantity])
  		end

  		redirect_to carrinho_path
  	end
  	
end
