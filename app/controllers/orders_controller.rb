class OrdersController < ApplicationController

	def show
		authenticate_user!
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
