class ApplicationController < ActionController::Base
	before_action :load_categories
	before_action :store_user_location!, if: :storable_location?
	skip_before_action :verify_authenticity_token  

	private
	
	def load_categories
		if session[:cart_id].nil?
			session[:cart_id] = session.id
		end
		@categories = Category.where(active: 1)
	end

	def storable_location?
  		request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      	store_location_for(:user, request.fullpath)
    end

    def after_sign_in_path_for(resource_or_scope)
	  	stored_location_for(resource_or_scope) || super
	end

end
