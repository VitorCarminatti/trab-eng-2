class ProductsController < ApplicationController
  
  	def index
 		 	
  	end

  	def show
  		@product = Product.find(params[:id])

  		if @product && params[:slug] != @product.name.parameterize
  			redirect_to "/produto/#{params[:id]}/#{@product.name.parameterize}"
  		end 
  	end

end
