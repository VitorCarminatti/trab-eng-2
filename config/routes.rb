Rails.application.routes.draw do
  	get 'carrinho', to: 'cart#show', as: 'carrinho'
  	post 'cart/add_to_cart'

  	get 'brands/index'

  	get 'products/index'
  	get '/produto/:id/(:slug)', to: 'products#show', as: 'produto'
  	devise_for :users
  	root 'home#index'

  	get 'pagamento', to: 'orders#show', as: 'pagamento'

  	devise_scope :user do
  		get 'login', to: 'devise/sessions#new'
      get 'cadastro', to: 'devise/registrations#new'
      delete 'logout', to: 'devise/sessions#destroy'
  	end

  	devise_scope :user do
  		
	end
end
