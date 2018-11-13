class Product < ApplicationRecord
	belongs_to :brand


	def price
  		byebug
  		if has_promotion
  			promotional_price
  		else
  			price
  		end
  	end
end
