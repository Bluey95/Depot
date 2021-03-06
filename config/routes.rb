Rails.application.routes.draw do
  resources :beauticians
  resources :schedules
  resources :clients
  resources :services
  resources :orders
  resources :line_item_products
  resources :line_items
get 'admin/index'


  resources :productsonsales
  get 'store_products/index'
  
  get '/pages/:page' => 'pages#show'
 get 'pages/about' => 'pages#about'
 get 'store/index' => 'store#index'
 get 'store_products/index' => 'store_products#index'
 get 'admin' => 'admin#index'
 get 'orders' => 'orders#index'
 get 'products' => 'products#index'
 get 'productsonsales' => 'productsonsales#index'
 get 'users' => 'users#index'
 get 'users/new' => 'users#new'

  
  controller :sessions do
 get 'login' => :new
 post 'login' => :create
 delete 'logout' => :destroy
 end

  resources :users
  resources :products do
  get :who_bought, on: :member
  end

  resources :productsonsales do
  get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  scope '(:locale)' do
resources :orders
resources :line_items
resources :carts

root 'pages#home', as: 'home_page', via: :all
 end

 resources :line_items do
    put 'decrease', on: :member
    put 'increase', on: :member
  end

  resources :line_item_products do
    put 'reduce', on: :member
    put 'add', on: :member
  end

 

end
