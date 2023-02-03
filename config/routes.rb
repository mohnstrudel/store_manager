Rails.application.routes.draw do
  get 'supplier_orders/index'
  get 'supplier_orders/show'
  get 'customer_orders/index'
  get 'customer_orders/show'
  get 'dashboard/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'dashboard#index'

  resources :products, :supplier_orders, :customer_orders
end
