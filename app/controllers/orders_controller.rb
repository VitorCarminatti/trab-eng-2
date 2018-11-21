class OrdersController < ApplicationController
	include CartHelper

	def show
		if total_itens <= 0
			redirect_to '/carrinho', flash: { alert: 'Adicione algo ao carrinho para continuar' }
		end

		authenticate_user!
	end

	def index
		if total_itens <= 0
			redirect_to '/carrinho', flash: { alert: 'Adicione algo ao carrinho para continuar' }
		end
	end

	def create
		cart_items = Cart.where(:session_id => session[:cart_id])

		order = Order.new
		order.user_id = current_user.id
		order.payment_type_id = params[:payment_type]
		order.total = total_price
		if order.save
			order_id = order.id

			cart_items.each do |item|
				product_order = ProductOrder.new
				product_order.order_id = order_id
				product_order.product_id = item.product_id
				product_order.quantity = item.quantity
				product_order.save

				product = Product.new
				product.decrement(:quantity, by = item.quantity)
				product.save
			end

			cart_clear

			hashids = Hashids.new("test_salt", 8)
			hash_id = hashids.encode(order_id)

			redirect_to "/pagamento/finalizar/#{hash_id.to_s}"
		else
			redirect_to "/pagamento"
		end
	end

	def finalize
		
	end

	protected
  	def authenticate_user!
	    if user_signed_in?
	      	super
	    else
	      	redirect_to login_path, :notice => 'Você precisa estar logado para continuar'
	    end
	end

end
