class Product < ApplicationRecord
	belongs_to :brand

	def has_promotional_price
    if has_promotion
      promotional_price
    else
      price
    end
  end

end
