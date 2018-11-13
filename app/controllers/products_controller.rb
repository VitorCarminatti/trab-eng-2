class ProductsController < ApplicationController
  
  	def index
 		 	
  	end

  	def show
  		@product = Product.find_by id: params[:id]
  		@brand = @product.brand
  	end

end
