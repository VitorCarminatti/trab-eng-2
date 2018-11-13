Rails.application.routes.draw do
  get 'brands/index'
  get 'products/index'
  get '/produto/:id/:slug', to: 'products#show', as: 'produto'
  devise_for :users
  root 'home#index'
end
