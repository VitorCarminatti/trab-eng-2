class Product < ApplicationRecord
	belongs_to :brand


	def price
  		if self.has_promotion
  			self.promotional_price
  		else
  			self.price
  		end
  	end
end
