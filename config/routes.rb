Rails.application.routes.draw do
  get 'franchises/new'
  get 'franchises/index'
  get 'brands/new'
  get 'brands/index'
  get 'supplier_orders/index'
  get 'supplier_orders/show'
  get 'customer_orders/index'
  get 'customer_orders/show'
  get 'dashboard/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'dashboard#index'

  resources :products, :customer_orders, :brands, :franchises

  resources :supplier_orders do
    resources :payments, module: :supplier_orders
  end

  namespace :api do
    namespace :v1 do
      resources :customer_orders
    end
  end
end
