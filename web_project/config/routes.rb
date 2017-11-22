Rails.application.routes.draw do
  resources :categories
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'products/index'

  get 'search/search_result'

  get 'search/search_show'
  get '/cart/add_to_cart_success', to: 'cart#add_to_cart_success'
    get '/cart/cart', to: 'cart#cart'


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  resources :products, only: [:index,:show]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy], defaults: { format: 'js' }
  resources :users, only: [:show, :edit, :update]

  root to: "products#index"


end
