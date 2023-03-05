Rails.application.routes.draw do
  get 'dashboard/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'dashboard#index'

  get '/missing_purchases', to: 'products#missing_purchases'

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
