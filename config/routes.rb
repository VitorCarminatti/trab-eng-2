Rails.application.routes.draw do
  get 'carrinho', to: 'cart#show', as: 'carrinho'
  post 'cart/add_to_cart'

  get 'brands/index'
  get 'products/index'
  get '/produto/:id/(:slug)', to: 'products#show', as: 'produto'
  devise_for :users
  root 'home#index'
end
