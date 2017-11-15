Rails.application.routes.draw do
  resources :categories
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'products/index'

  get 'search_results' => 'product#search_results', as: 'search_results'



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  resources :products, only: [:index,:show]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
  root to: "products#index"
end
